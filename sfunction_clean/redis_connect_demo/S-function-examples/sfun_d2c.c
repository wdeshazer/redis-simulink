/*
 *
 * File    : sfun_d2c.c
 * Abstract:
 *
 *   This S-Function converts a discrete signal into a piece-wise linear continuous signal.
 *
 *   A key aspect of converting a discrete signal to continuous is extrapolation. This block
 *   implements linear extrapolation, where the slope of the piece-wise linear output signal is
 *   updated after each discrete input signal value.
 *
 *   The first parameter specifies the initial output value.
 *
 *   The second parameter specifies which formula to use when updating the slope:
 *     0 - slower rate of change of the output signal, avoiding overshoots
 *     1 - faster rate of change of the output signal, minimizes error, but may cause overshoots
 *
 *   Irrespective of the formula, the extrapolated value at the output will differ from the actual
 *   input value. In case this difference becomes too large, it is better to "reset" at the latest
 *   input value and start all over. The third parameter specifies the tolerance to decide when to
 *   reset.
 *
 *   The output port sample time is set to continuous and its continuous quantity attribute is set
 *   to true. Setting the sample time to continuous indicates that the signal value is defined at
 *   all points in the simulation time interval. Setting the continuous quantity attribute to true
 *   indicates that the signal as a function of time does not have any discontinuities. These two
 *   settings inform the Simulink solver that the output port signal is a continuous function of
 *   time and therefore the solver does not need to be reset at the discrete time points where the
 *   input signal changes.
 *
 *   You can use this S-Function in your models as is without any changes.  Additionally you can
 *   study and modify the code in this S-Function example to understand the power of the Simulink
 *   S-Function interface to write complex dynamic system equations that closely interact with the
 *   simulation engine.
 *
 *   Author: Murali Yeddanapudi, Dec-2017, Nov-2018
 *   Copyright 2017-2018 The MathWorks, Inc.
 */

#define S_FUNCTION_NAME   sfun_d2c
#define S_FUNCTION_LEVEL  2

#include "simstruc.h"
#include <math.h>

#define DATA_INP   0
#define NUM_INP    1

#define DATA_OUT   0
#define NUM_OUT    1

#define IY_PIDX    0
#define OR_PIDX    1
#define ET_PIDX    2
#define NUM_PRMS   3

#define Ck_DWIDX    0
#define Tk_DWIDX    1
#define Uk_DWIDX    2
#define Mk_DWIDX    3

#define initialOutputPrmMXA(S)         ssGetSFcnParam(S, IY_PIDX)
#define outputRatePrmMXA(S)            ssGetSFcnParam(S, OR_PIDX)
#define errorTolPrmMXA(S)              ssGetSFcnParam(S, ET_PIDX)


static real_T locGetInitialOutputPrm(SimStruct const* S)
{
    return mxGetScalar(initialOutputPrmMXA(S));
}

static boolean_T locGetOutputRateIsSlowPrm(SimStruct const* S)
{
    return mxGetScalar(outputRatePrmMXA(S)) == 0;
}

static real_T locGetErrorTolPrm(SimStruct const* S)
{
#ifdef MATLAB_MEX_FILE
    const mxArray* prmMXA = errorTolPrmMXA(S);
    if ( !mxIsDouble(prmMXA) ||
         mxIsComplex(prmMXA) ||
         !mxIsScalar(prmMXA) ||
         mxIsNaN(mxGetScalar(prmMXA)) ) {
        ssSetErrorStatus(S,"ExtrapolationErrorTolerance must be positive scalar");
        return mxGetNaN();
    } else {
        real_T af = mxGetScalar(prmMXA);
        if (af <= 0) {
            ssSetErrorStatus(S,"ExtrapolationErrorTolerance must be positive scalar");
            return mxGetNaN();
        }
        return af;
    }
#else
    real_T af = mxGetScalar(errorTolPrmMXA(S));
    if (af <= 0) {
        ssSetErrorStatus(S,"ExtrapolationErrorTolerance must be positive scalar");
        return mxGetNaN();
    }
    return af;
#endif
}

static bool locIsInputPortContinuous(SimStruct const* S, int_T pIdx)
{
    return (ssGetInputPortSampleTime(S,pIdx) == CONTINUOUS_SAMPLE_TIME &&
            ssGetInputPortOffsetTime(S,pIdx) == 0);
}

static bool locIsOutputPortContinuous(SimStruct const* S, int_T pIdx)
{
    return (ssGetOutputPortSampleTime(S,pIdx) == CONTINUOUS_SAMPLE_TIME &&
            ssGetOutputPortOffsetTime(S,pIdx) == 0);
}

static real_T locGetDWorkCk(SimStruct const* S)
{
    return *((real_T*)(ssGetDWork(S, Ck_DWIDX)));
}
static void locSetDWorkCk(SimStruct* S, real_T v)
{
    *((real_T*)(ssGetDWork(S, Ck_DWIDX))) = v;
}

static real_T locGetDWorkTk(SimStruct const* S)
{
    return *((real_T*)(ssGetDWork(S, Tk_DWIDX)));
}
static void locSetDWorkTk(SimStruct* S, real_T v)
{
    *((real_T*)(ssGetDWork(S, Tk_DWIDX))) = v;
}

static real_T locGetDWorkUk(SimStruct const* S)
{
    return *((real_T*)(ssGetDWork(S, Uk_DWIDX)));
}
static void locSetDWorkUk(SimStruct* S, real_T v)
{
    *((real_T*)(ssGetDWork(S, Uk_DWIDX))) = v;
}

static real_T locGetDWorkMk(SimStruct const* S)
{
    return *((real_T*)(ssGetDWork(S, Mk_DWIDX)));
}
static void locSetDWorkMk(SimStruct* S, real_T v)
{
    *((real_T*)(ssGetDWork(S, Mk_DWIDX))) = v;
}

/*
 * Function: mdlCheckParameters
 * Abstract:
 *   Method to check that the S-Function parameters are valid
 *
 */
#define MDL_CHECK_PARAMETERS
static void mdlCheckParameters(SimStruct* S)
{
#if defined(MDL_CHECK_PARAMETERS) && defined(MATLAB_MEX_FILE)
    const mxArray* prmMXA;

    if (ssGetNumSFcnParams(S) != NUM_PRMS) {
        ssSetErrorStatus(S,"Invalid number of parameters");
        return;
    }

    /* initial output */
    prmMXA = initialOutputPrmMXA(S);
    if (!mxIsDouble(prmMXA) || mxIsComplex(prmMXA) || !mxIsScalar(prmMXA) || !mxIsFinite(mxGetScalar(prmMXA))) {
        ssSetErrorStatus(S,"Initial output must be real finite scalar");
        return;
    }

    /* output rate */
    prmMXA = outputRatePrmMXA(S);
    if (!mxIsDouble(prmMXA) || mxIsComplex(prmMXA) || !mxIsScalar(prmMXA) || !mxIsFinite(mxGetScalar(prmMXA))) {
        ssSetErrorStatus(S,"Output Rate must be either 0 or 1");
        return;
    }
    {
        real_T v = mxGetScalar(prmMXA);
        if ( !(v == 0 || v == 1) ) {
            ssSetErrorStatus(S,"Output Rate must be either 0 or 1");
            return;
        }
    }

    /* extrapolation error threshold */
    {
        real_T tol = locGetErrorTolPrm(S); /* sets error status, in case of error */
        (void)tol; /* unused */
    }
    
#endif
} /* mdlCheckParameters */

/*
 * Function: mdlInitializeSizes
 * Abstract:
 *   Method to configure the S-Function block
 *
 */
static void mdlInitializeSizes(SimStruct *S)
{
    /* Register the number of expected parameters and check their values */
    ssSetNumSFcnParams(S, NUM_PRMS);
    if (ssGetNumSFcnParams(S) != ssGetSFcnParamsCount(S)) return;
    mdlCheckParameters(S);
    if (ssGetErrorStatus(S) != NULL) return;
    ssSetSFcnParamTunable(S, IY_PIDX, false);
    ssSetSFcnParamTunable(S, OR_PIDX, false);
    ssSetSFcnParamTunable(S, ET_PIDX, true);

    ssSetNumSampleTimes(S, PORT_BASED_SAMPLE_TIMES);
    ssSetOperatingPointCompliance(S, USE_DEFAULT_OPERATING_POINT);

    /* register number of input ports and set attributes */
    if (!ssSetNumInputPorts(S, NUM_INP)) return;
    ssSetInputPortWidth(S, DATA_INP, 1);
    ssSetInputPortDataType(S, DATA_INP, SS_DOUBLE);
    ssSetInputPortDirectFeedThrough(S, DATA_INP, 0);
    ssSetInputPortRequiredContiguous(S, DATA_INP, 1);
    ssSetInputPortSampleTime(S, DATA_INP, INHERITED_SAMPLE_TIME);

    /* register number of output ports and set attributes */
    if (!ssSetNumOutputPorts(S, NUM_OUT)) return;
    ssSetOutputPortWidth(S, DATA_OUT, 1);
    ssSetOutputPortDataType(S, DATA_OUT, SS_DOUBLE);

    /* The settinge below indicates this output port signal is defined on continuous time line */
    ssSetOutputPortSampleTime(S, DATA_OUT, CONTINUOUS_SAMPLE_TIME);

    /*
     * Setting the flag below informs Simulink that this output port signal is continuous in time
     * and value (i.e., it is continuous in the mathematical sense)
     */
    ssSetOutputPortIsContinuousQuantity(S, DATA_OUT, true);

    /* Output needs to be persistent as it is used in update */
    ssSetOutputPortOptimOpts(S, DATA_OUT, SS_NOT_REUSABLE_AND_GLOBAL);

    /* Set this S-function as runtime thread-safe for multicore execution */
    ssSetRuntimeThreadSafetyCompliance(S, RUNTIME_THREAD_SAFETY_COMPLIANCE_TRUE);
    
    ssSetOptions(S, ssGetOptions(S) | SS_OPTION_EXCEPTION_FREE_CODE);

} /* mdlInitializeSizes */

/*
 * Function: mdlSetInputPortSampleTime
 * Abstract:
 *   This method is used because this block has port based sample times. It is called when Simulink
 *   has determined the sample time of this block's input port. For this block, we accept the sample
 *   time passed in, as long as it is not continuous.
 */
#define MDL_SET_INPUT_PORT_SAMPLE_TIME
static void mdlSetInputPortSampleTime(SimStruct* S,
                                      int_T ipIdx,
                                      real_T period,
                                      real_T offset)
{
    ssSetInputPortSampleTime(S, ipIdx, period);
    ssSetInputPortOffsetTime(S, ipIdx, offset);

    if (locIsInputPortContinuous(S, DATA_INP)) {
        ssSetErrorStatus(S, "Input port sample time cannot be continuous");
    }

    return;

} /* mdlSetInputPortSampleTime */


/*
 * Function: mdlSetOutputPortSampleTime
 * Abstract:
 *   This method is used because this block has port based sample times. It is called when Simulink
 *   has determined the sample time of this block's output port.  For this block, since sample time
 *   has already been specified, make sure that it is what we expect it to be and error out
 *   otherwise.
 */
#define MDL_SET_OUTPUT_PORT_SAMPLE_TIME
static void mdlSetOutputPortSampleTime(SimStruct* S,
                                       int_T opIdx,
                                       real_T period,
                                       real_T offset)
{
    ssSetOutputPortSampleTime(S, opIdx, period);
    ssSetOutputPortOffsetTime(S, opIdx, offset);

    if ( ssGetOutputPortSampleTime(S, DATA_OUT) != CONTINUOUS_SAMPLE_TIME &&
         ssGetOutputPortOffsetTime(S, DATA_OUT) != 0) {
        ssSetErrorStatus(S, "Invalid output port sample time");
    }
    return;

} /* mdlSetOutputPortSampleTime */

/*
 * Function: mdlInitializeSampleTimes
 * Abstract:
 *   This required method is called after (not before, since this block has port based sample times)
 *   sample times have been propagated. For this block, since everything has been taken care of in
 *   the sample time handshake methods, there is nothing to do here.
 *
 */
static void mdlInitializeSampleTimes(SimStruct* S)
{
} /* mdlInitializeSampleTimes */


/*
 * Function: mdlSetWorkWidths
 * Abstract:
 *   This method is called after Simulink has propagated the signal attributes (such as data types,
 *   sample times, etc.). This is where we can we register the required number of work vectors based
 *   on its configuration.
 *
 */
#define MDL_SET_WORK_WIDTHS
static void mdlSetWorkWidths(SimStruct* S)
{
    /*
     * The algorithm implemented here assumes that code in mdlOuputs that computes the continuous
     * output runs in the same task as the code in mdlUpdate that reads the discrete input and
     * updates the polynomial coefficients used to compute the outputs. Hence error out if this
     * single tasking assumption is not met.
     */
    if (ssGetSolverMode(S) == SOLVER_MODE_MULTITASKING) {
        ssSetErrorStatus(S,"Multi-tasking mode is not supported");
        return;
    }

    ssSetNumDWork(S, 4);
    
    ssSetDWorkName(S, Ck_DWIDX, "Ck");
    ssSetDWorkWidth(S, Ck_DWIDX, 1);
    ssSetDWorkDataType(S, Ck_DWIDX, SS_DOUBLE);

    ssSetDWorkName(S, Tk_DWIDX, "Tk");
    ssSetDWorkWidth(S, Tk_DWIDX, 1);
    ssSetDWorkDataType(S, Tk_DWIDX, SS_DOUBLE);

    ssSetDWorkName(S, Uk_DWIDX, "Uk");
    ssSetDWorkWidth(S, Uk_DWIDX, 1);
    ssSetDWorkDataType(S, Uk_DWIDX, SS_DOUBLE);

    ssSetDWorkName(S, Mk_DWIDX, "Mk");
    ssSetDWorkWidth(S, Mk_DWIDX, 1);
    ssSetDWorkDataType(S, Mk_DWIDX, SS_DOUBLE);
    
    /* Inform Simulink that this block can be placed inside ForEach subsystems */
    ssSupportsMultipleExecInstances(S, true)

} /* mdlSetWorkWidths */



static void locResetFormula(SimStruct* S, real_T ic)
{
    locSetDWorkCk(S, ic);
    locSetDWorkMk(S, 0.0);
}

/*
 * Function: mdlInitializeConditions
 * Abstract:
 *   This method is called at the start of simulation and when resetting the states of the system
 *   that contains this block. Here we (re)set the work vectors to their initial values.
 *
 */
#define MDL_INITIALIZE_CONDITIONS
static void mdlInitializeConditions(SimStruct* S)
{
    real_T ic = locGetInitialOutputPrm(S);
    
    locResetFormula(S, ic);
    locSetDWorkTk(S, mxGetNaN());
    locSetDWorkUk(S, mxGetNaN());

} /* mdlInitializeConditions */


/*
 * Function: mdlOutputs
 * Abstract:
 *   This method is called to compute the block outputs.
 *
 */
static void mdlOutputs(SimStruct* S, int_T tid)
{
    real_T* y = ssGetOutputPortRealSignal(S, DATA_OUT);

    /*
     * start at the output value from the last major step and linearly extrapolate, this will ensure
     * that the output is continuous in the mathematical sense.
     */
    real_T Ck = locGetDWorkCk(S);
    real_T Tkm1 = locGetDWorkTk(S);

    *y = Ck;
    if (mxIsFinite(Tkm1)) {
        real_T dt = ssGetT(S) - Tkm1;
        real_T Mk = locGetDWorkMk(S);
        *y += Mk*dt;
    }

} /* mdlOutputs */


/*
 * Function: mdlUpdate
 * Abstract:
 *   This method is called at every major time step. For this block, update the co-efficients of the
 *   polynomial approximating the output signal in the next integration step.
 */
#define MDL_UPDATE
static void mdlUpdate(SimStruct* S, int_T tid)
{
    int ipSTI = ssGetInputPortSampleTimeIndex(S,DATA_INP);
    boolean_T dataInpHasHit = ssIsSampleHit(S, ipSTI, tid);

    if (dataInpHasHit) { /* data input signal has a sample hit */

        const real_T Uk = ssGetInputPortRealSignal(S, DATA_INP)[0];

        const real_T Yk = ssGetOutputPortRealSignal(S, DATA_OUT)[0];
        real_T Tk = ssGetT(S);
        real_T Tkm1 = locGetDWorkTk(S);
        boolean_T reset = false; /* assume */
            
        if (!mxIsFinite(Tkm1)) { /* first update after initialize */
            reset = true;
        } else {
            real_T absUk = fabs(Uk);
            real_T tol = (absUk < 1 ? 1 : absUk) * locGetErrorTolPrm(S);
            real_T Ek = fabs(Yk-Uk);
            if (Ek > tol) {
                reset = true;
            } else {
                /* update co-efficients of the extrapolation formula */
                real_T h = Tk - Tkm1;
                real_T Ukm1 = locGetDWorkUk(S);
                real_T Mk = (Uk-Ukm1)/h;
                if (!locGetOutputRateIsSlowPrm(S)) { /* fast */
                    real_T Uh = Uk + Mk*h;
                    Mk = (Uh - Yk)/h;
                }
                locSetDWorkMk(S, Mk);
                locSetDWorkCk(S, Yk);
            }
        }
        if (reset) {
            locResetFormula(S, Uk);
            if (Uk != Yk) {
                ssSetBlockStateForSolverChangedAtMajorStep(S);
                ssSetContTimeOutputInconsistentWithStateAtMajorStep(S);
            }
        }
        locSetDWorkTk(S, Tk);
        locSetDWorkUk(S, Uk);
    }
} /* mdlUpdate */


/*
 * Function: mdlTerminate
 * Abstract:
 *   This method is called at the end of simulation.
 *
 */
static void mdlTerminate(SimStruct* S)
{
} /* mdlTerminate */


#ifdef MATLAB_MEX_FILE
# include "simulink.c"
#else
# include "cg_sfun.h"
#endif /* MATLAB_MEX_FILE */
