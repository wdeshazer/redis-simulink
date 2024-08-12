/*
 * SFTimeSignalDemo.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "SFTimeSignalDemo".
 *
 * Model version              : 1.16
 * Simulink Coder version : 24.1 (R2024a) 19-Nov-2023
 * C source code generated on : Fri Aug  9 05:00:50 2024
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "SFTimeSignalDemo.h"
#include "rtwtypes.h"
#include <math.h>
#include "SFTimeSignalDemo_private.h"

/* Block signals (default storage) */
B_SFTimeSignalDemo_T SFTimeSignalDemo_B;

/* Real-time model */
static RT_MODEL_SFTimeSignalDemo_T SFTimeSignalDemo_M_;
RT_MODEL_SFTimeSignalDemo_T *const SFTimeSignalDemo_M = &SFTimeSignalDemo_M_;

/* Model step function */
void SFTimeSignalDemo_step(void)
{
  /* Clock: '<Root>/Clock' */
  SFTimeSignalDemo_B.Clock = SFTimeSignalDemo_M->Timing.t[0];

  /* Sin: '<Root>/Sine Wave' */
  SFTimeSignalDemo_B.SineWave = sin(SFTimeSignalDemo_P.SineWave_Freq *
    SFTimeSignalDemo_M->Timing.t[0] + SFTimeSignalDemo_P.SineWave_Phase) *
    SFTimeSignalDemo_P.SineWave_Amp + SFTimeSignalDemo_P.SineWave_Bias;

  /* Matfile logging */
  rt_UpdateTXYLogVars(SFTimeSignalDemo_M->rtwLogInfo,
                      (SFTimeSignalDemo_M->Timing.t));

  /* signal main to stop simulation */
  {                                    /* Sample time: [0.0s, 0.0s] */
    if ((rtmGetTFinal(SFTimeSignalDemo_M)!=-1) &&
        !((rtmGetTFinal(SFTimeSignalDemo_M)-SFTimeSignalDemo_M->Timing.t[0]) >
          SFTimeSignalDemo_M->Timing.t[0] * (DBL_EPSILON))) {
      rtmSetErrorStatus(SFTimeSignalDemo_M, "Simulation finished");
    }
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++SFTimeSignalDemo_M->Timing.clockTick0)) {
    ++SFTimeSignalDemo_M->Timing.clockTickH0;
  }

  SFTimeSignalDemo_M->Timing.t[0] = SFTimeSignalDemo_M->Timing.clockTick0 *
    SFTimeSignalDemo_M->Timing.stepSize0 +
    SFTimeSignalDemo_M->Timing.clockTickH0 *
    SFTimeSignalDemo_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [0.2s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The resolution of this integer timer is 0.2, which is the step size
     * of the task. Size of "clockTick1" ensures timer will not overflow during the
     * application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    SFTimeSignalDemo_M->Timing.clockTick1++;
    if (!SFTimeSignalDemo_M->Timing.clockTick1) {
      SFTimeSignalDemo_M->Timing.clockTickH1++;
    }
  }
}

/* Model initialize function */
void SFTimeSignalDemo_initialize(void)
{
  /* Registration code */

  /* initialize real-time model */
  (void) memset((void *)SFTimeSignalDemo_M, 0,
                sizeof(RT_MODEL_SFTimeSignalDemo_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&SFTimeSignalDemo_M->solverInfo,
                          &SFTimeSignalDemo_M->Timing.simTimeStep);
    rtsiSetTPtr(&SFTimeSignalDemo_M->solverInfo, &rtmGetTPtr(SFTimeSignalDemo_M));
    rtsiSetStepSizePtr(&SFTimeSignalDemo_M->solverInfo,
                       &SFTimeSignalDemo_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&SFTimeSignalDemo_M->solverInfo, (&rtmGetErrorStatus
      (SFTimeSignalDemo_M)));
    rtsiSetRTModelPtr(&SFTimeSignalDemo_M->solverInfo, SFTimeSignalDemo_M);
  }

  rtsiSetSimTimeStep(&SFTimeSignalDemo_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetIsMinorTimeStepWithModeChange(&SFTimeSignalDemo_M->solverInfo, false);
  rtsiSetIsContModeFrozen(&SFTimeSignalDemo_M->solverInfo, false);
  rtsiSetSolverName(&SFTimeSignalDemo_M->solverInfo,"FixedStepDiscrete");
  rtmSetTPtr(SFTimeSignalDemo_M, &SFTimeSignalDemo_M->Timing.tArray[0]);
  rtmSetTFinal(SFTimeSignalDemo_M, 10.0);
  SFTimeSignalDemo_M->Timing.stepSize0 = 0.2;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = (NULL);
    SFTimeSignalDemo_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(SFTimeSignalDemo_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(SFTimeSignalDemo_M->rtwLogInfo, (NULL));
    rtliSetLogT(SFTimeSignalDemo_M->rtwLogInfo, "tout");
    rtliSetLogX(SFTimeSignalDemo_M->rtwLogInfo, "");
    rtliSetLogXFinal(SFTimeSignalDemo_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(SFTimeSignalDemo_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(SFTimeSignalDemo_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(SFTimeSignalDemo_M->rtwLogInfo, 0);
    rtliSetLogDecimation(SFTimeSignalDemo_M->rtwLogInfo, 1);
    rtliSetLogY(SFTimeSignalDemo_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(SFTimeSignalDemo_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(SFTimeSignalDemo_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &SFTimeSignalDemo_B), 0,
                sizeof(B_SFTimeSignalDemo_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(SFTimeSignalDemo_M->rtwLogInfo, 0.0,
    rtmGetTFinal(SFTimeSignalDemo_M), SFTimeSignalDemo_M->Timing.stepSize0,
    (&rtmGetErrorStatus(SFTimeSignalDemo_M)));
}

/* Model terminate function */
void SFTimeSignalDemo_terminate(void)
{
  /* (no terminate code required) */
}
