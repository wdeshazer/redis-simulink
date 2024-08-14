#define S_FUNCTION_LEVEL               2
#define S_FUNCTION_NAME                sfRedis

/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
/* %%%-SFUNWIZ_defines_Changes_BEGIN --- EDIT HERE TO _END */
#define NUM_INPUTS                     1

/* Input Port  0 */
#define IN_PORT_0_NAME                 u0
#define INPUT_0_DIMS_ND                {DYNAMICALLY_SIZED,1}
#define INPUT_0_NUM_ELEMS              DYNAMICALLY_SIZED
#define INPUT_0_WIDTH                  DYNAMICALLY_SIZED
#define INPUT_DIMS_0_COL               1
#define INPUT_0_DTYPE                  real_T
#define INPUT_0_COMPLEX                COMPLEX_NO
#define INPUT_0_UNIT                   ""
#define IN_0_BUS_BASED                 0
#define IN_0_BUS_NAME
#define IN_0_DIMS                      1-D
#define INPUT_0_FEEDTHROUGH            1
#define IN_0_ISSIGNED                  0
#define IN_0_WORDLENGTH                8
#define IN_0_FIXPOINTSCALING           1
#define IN_0_FRACTIONLENGTH            9
#define IN_0_BIAS                      0
#define IN_0_SLOPE                     0.125
#define NUM_OUTPUTS                    1

/* Output Port  0 */
#define OUT_PORT_0_NAME                y0
#define OUTPUT_0_DIMS_ND               {DYNAMICALLY_SIZED,1}
#define OUTPUT_0_NUM_ELEMS             DYNAMICALLY_SIZED
#define OUTPUT_0_WIDTH                 DYNAMICALLY_SIZED
#define OUTPUT_DIMS_0_COL              1
#define OUTPUT_0_DTYPE                 real_T
#define OUTPUT_0_COMPLEX               COMPLEX_NO
#define OUTPUT_0_UNIT                  ""
#define OUT_0_BUS_BASED                0
#define OUT_0_BUS_NAME
#define OUT_0_DIMS                     1-D
#define OUT_0_ISSIGNED                 1
#define OUT_0_WORDLENGTH               8
#define OUT_0_FIXPOINTSCALING          1
#define OUT_0_FRACTIONLENGTH           3
#define OUT_0_BIAS                     0
#define OUT_0_SLOPE                    0.125
#define NPARAMS                        3

/* Parameter 0 */
#define PARAMETER_0_NAME               host
#define PARAMETER_0_DTYPE              uint16_T
#define PARAMETER_0_COMPLEX            COMPLEX_NO
#define PARAMETER_0_UNIT               ""

/* Parameter 1 */
#define PARAMETER_1_NAME               port
#define PARAMETER_1_DTYPE              int16_T
#define PARAMETER_1_COMPLEX            COMPLEX_NO
#define PARAMETER_1_UNIT               ""

/* Parameter 2 */
#define PARAMETER_2_NAME               passwd
#define PARAMETER_2_DTYPE              uint16_T
#define PARAMETER_2_COMPLEX            COMPLEX_NO
#define PARAMETER_2_UNIT               ""
#define SAMPLE_TIME_0                  INHERITED_SAMPLE_TIME
#define NUM_DISC_STATES                0
#define DISC_STATES_IC                 [0]
#define NUM_CONT_STATES                0
#define CONT_STATES_IC                 [0]
#define SFUNWIZ_GENERATE_TLC           0
#define SOURCEFILES                    "__SFB__LIB_PATH sfHiredis/hiredis_mex/__SFB__hiredis__SFB__libhiredis.dylib"
#define PANELINDEX                     N/A
#define USE_SIMSTRUCT                  1
#define SHOW_COMPILE_STEPS             1
#define CREATE_DEBUG_MEXFILE           1
#define SAVE_CODE_ONLY                 1
#define SFUNWIZ_REVISION               3.0

/* %%%-SFUNWIZ_defines_Changes_END --- EDIT HERE TO _BEGIN */
/*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
#include "simstruc.h"
#define PARAM_DEF0(S)                  ssGetSFcnParam(S, 0)
#define PARAM_DEF1(S)                  ssGetSFcnParam(S, 1)
#define PARAM_DEF2(S)                  ssGetSFcnParam(S, 2)
#define IS_PARAM_INT16(pVal)           (mxIsNumeric(pVal) && !mxIsLogical(pVal) &&\
!mxIsEmpty(pVal) && !mxIsSparse(pVal) && !mxIsComplex(pVal) && mxIsInt16(pVal))
#define IS_PARAM_UINT16(pVal)          (mxIsNumeric(pVal) && !mxIsLogical(pVal) &&\
!mxIsEmpty(pVal) && !mxIsSparse(pVal) && !mxIsComplex(pVal) && mxIsUint16(pVal))
