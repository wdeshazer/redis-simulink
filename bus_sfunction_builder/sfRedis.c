#define S_FUNCTION_LEVEL               2
#define S_FUNCTION_NAME                sfRedis
#define NUM_INPUTS                     1

/* Input Port  0 */
#define IN_PORT_0_NAME                 u0
#define INPUT_0_DIMS_ND                {DYNAMICALLY_SIZED,1}
#define INPUT_0_NUM_ELEMS              DYNAMICALLY_SIZED
#define INPUT_0_WIDTH                  DYNAMICALLY_SIZED
#define INPUT_DIMS_0_COL               1
#define IN_0_BUS_BASED                 1
#define IN_0_BUS_NAME                  sfRedisBus
#define IN_0_DIMS                      1-D
#define INPUT_0_FEEDTHROUGH            1
#define NUM_OUTPUTS                    1

/* Output Port  0 */
#define OUT_PORT_0_NAME                y0
#define OUTPUT_0_DIMS_ND               {DYNAMICALLY_SIZED,1}
#define OUTPUT_0_NUM_ELEMS             DYNAMICALLY_SIZED
#define OUTPUT_0_WIDTH                 DYNAMICALLY_SIZED
#define OUT_0_BUS_BASED                0
#define OUT_0_BUS_NAME
#define OUT_0_DIMS                     1-D
#define NPARAMS                        3

/* Parameter 0 */
#define PARAMETER_0_NAME               host
#define PARAMETER_0_DTYPE              uint16_T

/* Parameter 1 */
#define PARAMETER_1_NAME               port
#define PARAMETER_1_DTYPE              int16_T

/* Parameter 2 */
#define PARAMETER_2_NAME               passwd
#define PARAMETER_2_DTYPE              uint16_T


#define SAMPLE_TIME_0                  INHERITED_SAMPLE_TIME
#define NUM_DISC_STATES                0
#define DISC_STATES_IC                 [0]
#define NUM_CONT_STATES                0
#define CONT_STATES_IC                 [0]
#define SOURCEFILES                    "__SFB__LIB_PATH sfHiredis/hiredis_mex/__SFB__hiredis__SFB__libhiredis.dylib"

#include "simstruc.h"
#define PARAM_DEF0(S)                  ssGetSFcnParam(S, 0)
#define PARAM_DEF1(S)                  ssGetSFcnParam(S, 1)
#define PARAM_DEF2(S)                  ssGetSFcnParam(S, 2)
#define IS_PARAM_INT16(pVal)           (mxIsNumeric(pVal) && !mxIsLogical(pVal) &&\
!mxIsEmpty(pVal) && !mxIsSparse(pVal) && !mxIsComplex(pVal) && mxIsInt16(pVal))
#define IS_PARAM_UINT16(pVal)          (mxIsNumeric(pVal) && !mxIsLogical(pVal) &&\
!mxIsEmpty(pVal) && !mxIsSparse(pVal) && !mxIsComplex(pVal) && mxIsUint16(pVal))

extern void sfRedis_Start_wrapper(SimStruct *S,
  const uint16_T *host, const int_T p_width0,
  const int16_T *port, const int_T p_width1,
  const uint16_T *passwd, const int_T p_width2,
  void **pW);
extern void sfRedis_Outputs_wrapper(SimStruct *S,
  const real_T *u0, const int_T u_0_width,
  real_T *y0,   const int_T y_0_width,
  void **pW);
extern void sfRedis_Terminate_wrapper(SimStruct *S;
  void **pW);


/* Function: mdlCheckParameters =============================================
 * Abstract:
 *     Verify parameter definitions and types.
 */
static void mdlCheckParameters(SimStruct *S)
{
  int paramIndex = 0;
  bool invalidParam = false;

  /* All parameters must match the S-function Builder Dialog */
  {
    const mxArray *pVal0 = ssGetSFcnParam(S, 0);
    if (!IS_PARAM_UINT16(pVal0)) {
      invalidParam = true;
      paramIndex = 0;
      goto EXIT_POINT;
    }
  }

  {
    const mxArray *pVal1 = ssGetSFcnParam(S, 1);
    if (!IS_PARAM_INT16(pVal1)) {
      invalidParam = true;
      paramIndex = 1;
      goto EXIT_POINT;
    }
  }

  {
    const mxArray *pVal2 = ssGetSFcnParam(S, 2);
    if (!IS_PARAM_UINT16(pVal2)) {
      invalidParam = true;
      paramIndex = 2;
      goto EXIT_POINT;
    }
  }

 EXIT_POINT:
  if (invalidParam) {
    static char parameterErrorMsg[1024];
    __sfb_snprintf_(parameterErrorMsg, 1024,
                    "The data type and or complexity of parameter %d does not match the "
                    "information specified in the S-function Builder dialog. "
                    "For non-double parameters you will need to cast them using int8, int16, "
                    "int32, uint8, uint16, uint32 or boolean.", paramIndex + 1);
    ssSetLocalErrorStatus(S, parameterErrorMsg);
  }

  return;
}

/* Function: mdlInitializeSizes ===============================================
 * Abstract:
 *   Setup sizes of the various vectors.
 */
static void mdlInitializeSizes(SimStruct *S)
{
  ssSetNumSFcnParams(S, NPARAMS);      /* Number of expected parameters */

  // if (ssGetNumSFcnParams(S) == ssGetSFcnParamsCount(S)) {
  //   mdlCheckParameters(S);
  //   if (ssGetErrorStatus(S) != NULL) {
  //     return;
  //   }
  // } else {
  //   return;           /* Parameter mismatch will be reported by Simulink */
  // }

  ssSetArrayLayoutForCodeGen(S, SS_ALL);
  ssSetOperatingPointCompliance(S, DISALLOW_OPERATING_POINT);
  ssSetNumContStates(S, NUM_CONT_STATES);
  ssSetNumDiscStates(S, NUM_DISC_STATES);
  if (!ssSetNumInputPorts(S, NUM_INPUTS))
    return;

  /* Input Port 0 */
  ssSetInputPortWidth(S, 0, INPUT_0_NUM_ELEMS);
  ssSetInputPortDataType(S, 0, SS_DOUBLE);
  ssSetInputPortComplexSignal(S, 0, INPUT_0_COMPLEX);
  ssSetInputPortDirectFeedThrough(S, 0, INPUT_0_FEEDTHROUGH);
  ssSetInputPortRequiredContiguous(S, 0, 1);/*direct input signal access*/

  /*
   * Configure the Units for Input Ports
   */
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {


    UnitId inUnitIdReg;
    ssRegisterUnitFromExpr(S, INPUT_0_UNIT, &inUnitIdReg);
    if (inUnitIdReg != INVALID_UNIT_ID) {
      ssSetInputPortUnit(S, 0, inUnitIdReg);
    } else {
      ssSetLocalErrorStatus(S,
                            "Invalid Unit provided for input port u0 of S-Function sfRedis");
      return;
    }

  }

  if (!ssSetNumOutputPorts(S, NUM_OUTPUTS))
    return;

  /* Output Port 0 */
  ssSetOutputPortWidth(S, 0, OUTPUT_0_NUM_ELEMS);
  ssSetOutputPortDataType(S, 0, SS_DOUBLE);
  ssSetOutputPortComplexSignal(S, 0, OUTPUT_0_COMPLEX);

  /*
   * Configure the Units for Output Ports
   */
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {

    UnitId outUnitIdReg;
    ssRegisterUnitFromExpr(S, OUTPUT_0_UNIT, &outUnitIdReg);
    if (outUnitIdReg != INVALID_UNIT_ID) {
      ssSetOutputPortUnit(S, 0, outUnitIdReg);
    } else {
      ssSetLocalErrorStatus(S,
                            "Invalid Unit provided for output port y0 of S-Function sfRedis");
      return;
    }
  }

  ssSetNumPWork(S, 1400);
  ssSetNumSampleTimes(S, 1);
  ssSetNumRWork(S, 0);
  ssSetNumIWork(S, 0);
  ssSetNumModes(S, 0);
  ssSetNumNonsampledZCs(S, 0);
  ssSetSimulinkVersionGeneratedIn(S, "24.1");

  /* Take care when specifying exception free code - see sfuntmpl_doc.c */
  ssSetRuntimeThreadSafetyCompliance(S, RUNTIME_THREAD_SAFETY_COMPLIANCE_FALSE);
  ssSetOptions(S, (SS_OPTION_EXCEPTION_FREE_CODE |
                   SS_OPTION_WORKS_WITH_CODE_REUSE));
}

#define MDL_SET_INPUT_PORT_DIMENSION_INFO

static void mdlSetInputPortDimensionInfo(SimStruct *S,
  int_T port,
  const DimsInfo_T *dimsInfo)
{
  if (!ssSetInputPortDimensionInfo(S, port, dimsInfo))
    return;
}

#define MDL_SET_OUTPUT_PORT_DIMENSION_INFO
#if defined(MDL_SET_OUTPUT_PORT_DIMENSION_INFO)

static void mdlSetOutputPortDimensionInfo(SimStruct *S,
  int_T port,
  const DimsInfo_T *dimsInfo)
{
  if (!ssSetOutputPortDimensionInfo(S, port, dimsInfo))
    return;
}

/* Function: mdlInitializeSampleTimes =========================================
 * Abstract:
 *    Specifiy  the sample time.
 */
static void mdlInitializeSampleTimes(SimStruct *S)
{
  ssSetSampleTime(S, 0, SAMPLE_TIME_0);
  ssSetModelReferenceSampleTimeDefaultInheritance(S);
  ssSetOffsetTime(S, 0, 0.0);
}

#define MDL_SET_INPUT_PORT_DATA_TYPE

static void mdlSetInputPortDataType(SimStruct *S, int port, DTypeId dType)
{
  ssSetInputPortDataType(S, 0, dType);
}

#define MDL_SET_OUTPUT_PORT_DATA_TYPE

static void mdlSetOutputPortDataType(SimStruct *S, int port, DTypeId dType)
{
  ssSetOutputPortDataType(S, 0, dType);
}

#define MDL_SET_DEFAULT_PORT_DATA_TYPES

static void mdlSetDefaultPortDataTypes(SimStruct *S)
{
  ssSetInputPortDataType(S, 0, SS_DOUBLE);
  ssSetOutputPortDataType(S, 0, SS_DOUBLE);
}

#define MDL_SET_WORK_WIDTHS
#if defined(MDL_SET_WORK_WIDTHS) && defined(MATLAB_MEX_FILE)

static void mdlSetWorkWidths(SimStruct *S)
{
}

#endif

/* Function: mdlStart =======================================================
 * Abstract:
 *    This function is called once at start of model execution. If you
 *    have states that should be initialized once, this is the place
 *    to do it.
 */
static void mdlStart(SimStruct *S)
{
  void **pW = ssGetPWork(S);
  const int_T p_width0 = mxGetNumberOfElements(PARAM_DEF0(S));
  const int_T p_width1 = mxGetNumberOfElements(PARAM_DEF1(S));
  const int_T p_width2 = mxGetNumberOfElements(PARAM_DEF2(S));
  const uint16_T *host = (const uint16_T *) mxGetUint16s(PARAM_DEF0(S));
  const int16_T *port = (const int16_T *) mxGetInt16s(PARAM_DEF1(S));
  const uint16_T *passwd = (const uint16_T *) mxGetUint16s(PARAM_DEF2(S));
  sfRedis_Start_wrapper(S, host, p_width0, port, p_width1, passwd, p_width2, pW);
}

/* Function: mdlOutputs =======================================================
 *
 */
static void mdlOutputs(SimStruct *S, int_T tid)
{
  void **pW = ssGetPWork(S);
  const real_T *u0 = (real_T *) ssGetInputPortRealSignal(S, 0);
  real_T *y0 = (real_T *) ssGetOutputPortRealSignal(S, 0);
  const int_T y_0_width = ssGetOutputPortWidth(S, 0);
  const int_T u_0_width = ssGetInputPortWidth(S, 0);
  sfRedis_Outputs_wrapper(S, u0, y0, y_0_width, u_0_width, pW);
}

/* Function: mdlTerminate =====================================================
 * Abstract:
 *    In this function, you should perform any actions that are necessary
 *    at the termination of a simulation.  For example, if memory was
 *    allocated in mdlStart, this is the place to free it.
 */
static void mdlTerminate(SimStruct *S)
{
  void **pW = ssGetPWork(S);
  const int_T p_width0 = mxGetNumberOfElements(PARAM_DEF0(S));
  const int_T p_width1 = mxGetNumberOfElements(PARAM_DEF1(S));
  sfRedis_Terminate_wrapper(S, pW);
}

#ifdef MATLAB_MEX_FILE                 /* Is this file being compiled as a MEX-file? */
#include "simulink.c"                  /* MEX-file interface mechanism */
#else
#include "cg_sfun.h"                   /* Code generation registration function */
#endif
