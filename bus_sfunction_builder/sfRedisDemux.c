
/*
 * Include Files
 *
 */
#include "simstruc.h"



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
#include "mex.h"
#include "hiredis.h"
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Create external references here.
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */

/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Start function
 *
 */

/* Define the run-time parameter data type */
#define RUN_TIME_DATA_TYPE SS_DOUBLE
#if RUN_TIME_DATA_TYPE == SS_DOUBLE
typedef real_T RunTimeDataType;
#endif

#define SIN_IDX 0
#define SIN(S) ssGetSFcnParam(S,SIN_IDX)

#define CLOCK_IDX  1
#define CLOCK(S) ssGetSFcnParam(S,CLOCK_IDX)

#define SIN_OUT_IDX 2
#define SIN_OUT(S) ssGetSFcnParam(S,SIN_OUT_IDX)

#define CLOCK_OUT_IDX  3
#define CLOCK_OUT(S) ssGetSFcnParam(S,CLOCK_OUT_IDX)

#define NPARAMS   4

typedef struct ssParamRec_tag {
    const char *name;
    int_T      nDimensions;
    int_T      *dimensions;
    DTypeId    dataTypeId;
    boolean_T  complexSignal;
    void       *data;
    const void *dataAttributes;
    int_T      nDlgParamIndices;
    int_T      *dlgParamIndices;
    TransformedFlag transformed; /* Transformed status */
    boolean_T  outputAsMatrix;   /* Write out parameter
                                  * as a vector (false)
                                  * [default] or a matrix (true)
                                  */
} ssParamRec;



    /* Configure run-time parameter information */
    ssParamRec p; /* Initialize an ssParamRec structure */

    p.name             = "Mass";
    p.nDimensions      = 2;
    p.dimensions       = massDims;
    p.dataTypeId       = RUN_TIME_DATA_TYPE;
    p.complexSignal    = COMPLEX_NO;
    p.data             = mass;
    p.dataAttributes   = NULL;
    p.nDlgParamIndices = 2;
    p.dlgParamIndices  = dlg;
    p.transformed      = RTPARAM_TRANSFORMED;
    p.outputAsMatrix   = false;

    /* Set number of run-time parameters  */
    if (!ssSetNumRunTimeParams(S, 1)) return;
    /* Set run-time parameter information */
    if (!ssSetRunTimeParamInfo(S,0,&p)) return;

boolean_T ssSetNumRunTimeParams(SimStruct *S, int_T num);

void sfRedis_BusReader(SimStruct *S, void **pW, real_T *xC, real_T *xD)
{
/* Demux Input And Output Signals For Port Identification */

  int nC = ssGetNumContStatesAsInt;

  // ssGetdX	Get the derivatives of the continuous states of an S-function.
  // ssSetInputPortDimsSameAsOutputPortDims
  // ssGetStopRequested and ssSetStopRequested

  if ssGetBusElementName(S, )
  for (i = 0; i < nC ; i++) {
    printf("%d\n", i);
  }
  UnitID id = ssGetInputPortUnit(S, 0)

  get_param(gcb,'PortHandles');

  if ssIsDataTypeABus(S, 0)
  {

    DTypeId    dType    = ssGetOutputPortDataType(S, 0);
    const void *u       = ssGetInputPortSignal(S, 0);
    int        numElems = ssGetNumBusElements(S, dType);
    int        i;

    for(i=0; i<numElems i++)
    {
      int_T elemType = ssGetBusElementDataType(S, dType, i);

      if (elemType == SS_DOUBLE) {
        /* Process signal here */
      } else {
          ...
      } // Process Data type
    } // for numElems
  } // ssIsDataTypeABus
}

void sfRedis_Start_wrapper(real_T *xC,
			real_T *xD,
			void **pW,
			const uint8_T *host, const int_T p_width0,
			const int32_T *port, const int_T p_width1,
			const uint8_T *passwd, const int_T p_width2,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Start_Changes_BEGIN --- EDIT HERE TO _END */
ssPrintf("Initiating a Connection to REDIS...\n");

    // This could be more informative. Like run Matlab
    if (host == NULL || port == NULL || passwd == NULL) {
        char buffer[120];
        sprintf(buffer, "Missing authentication info. Run Matlab startup or setup/repair config");
        ssSetErrorStatus(S, buffer);
    }

    redisContext *ctx = redisConnect((char *)host, *port);

    if (ctx == NULL || ctx->err) {

        // https://www.baeldung.com/cs/valid-characters-hostname
        // A hostname can contain a maximum of 253 characters, including the dots
        int n_host = 253, n_port = 4, REDIS_ERR_LENGTH = 128, NULL_LENGTH = 1;

        char *fmt = "Error connecting to REDIS SERVER %s:%d: %s";
        int nmsg_main = strlen(fmt) - strlen("%s%d%s");
        int n_err_msg = nmsg_main + REDIS_ERR_LENGTH + n_host + n_port + NULL_LENGTH;

        size_t size=n_err_msg;
        char *buffer = (char*)malloc(size);

        sprintf(buffer, fmt, host, port, ctx->errstr);
        ssSetErrorStatus(S, buffer);
        free(buffer);

    }else{
        ssPrintf("Connected!\n");
        pW[0] = *ctx;
    }

    const char *cmd = "AUTH ";
    int NULL_LENGTH = 1;

    size_t size = strlen(cmd) + strlen((const char*)passwd) + NULL_LENGTH;
    char *buffer = (char*)malloc(size);

    redisReply *reply = redisCommand(ctx, (const char*)passwd);


    // We could get sophisticated with the connection messaging so that it detects
    // the precise error.
    if (!buffer) {
    }

    int success = snprintf(buffer, size, "%s%s", cmd, passwd);

    if (success < 0) {

        char *fmt = "Failed AUTH: no reply informtation. Check Network Connection (VPN)";
        int nmsg_main = strlen(fmt) - strlen("%s%d%s");

        // File: hiredis/hiredis.h
        // 261:     char errstr[128]; /* String representation of error when applicable */        int n_host = 253, n_port = 4, REDIS_ERR_LENGTH = 128, NULL_LENGTH = 1;
        int n_host = 253, n_port = 4, REDIS_ERR_LENGTH = 128, NULL_LENGTH = 1;
        int n_err_msg = nmsg_main + REDIS_ERR_LENGTH + n_host + n_port + NULL_LENGTH;

        size_t size=n_err_msg;
        char *buffer = (char*)malloc(size);

        sprintf(buffer, fmt, host, port, ctx->errstr);
        ssSetErrorStatus(S, buffer);
    }
/* %%%-SFUNWIZ_wrapper_Start_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Output function
 *
 */
void sfRedis_Outputs_wrapper(const real_T *u0,
			real_T *y0,
			const real_T *xD,
			const real_T *xC,
			void **pW,
			const uint8_T *host, const int_T p_width0,
			const int32_T *port, const int_T p_width1,
			const uint8_T *passwd, const int_T p_width2,
			const int_T y_width,
			const int_T u_width,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
if (ssGetPWork(S) != NULL) {
    redisContext *ctx = (redisContext *) ssGetPWorkValue(S,0);
    if (ctx == NULL) {
        char buffer[120];
        sprintf(buffer, "Redis connection information not visible sfRedis_Outputs");
        ssSetErrorStatus(S, buffer);
    }
    redisContext *ctx =
  }
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Updates function
 *
 */
void sfRedis_Update_wrapper(const real_T *u0,
			real_T *y0,
			real_T *xD,
			void **pW,
			const uint8_T *host, const int_T p_width0,
			const int32_T *port, const int_T p_width1,
			const uint8_T *passwd, const int_T p_width2,
			const int_T y_width,
			const int_T u_width,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
redisContext *ctx = (redisContext *) ssGetPWorkValue(S,0);
    if (ctx == NULL) {
        char buffer[120];
        sprintf(buffer, "Redis connection information not visible sfRedis_Update");
        ssSetErrorStatus(S, buffer);
    }
    ssSetPWorkValue(S,0,NULL);
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Derivatives function
 *
 */
void sfRedis_Derivatives_wrapper(const real_T *u0,
			real_T *y0,
			real_T *dx,
			real_T *xC,
			void **pW,
			const uint8_T *host, const int_T p_width0,
			const int32_T *port, const int_T p_width1,
			const uint8_T *passwd, const int_T p_width2,
			const int_T y_width,
			const int_T u_width,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_BEGIN --- EDIT HERE TO _END */
redisContext *ctx = (redisContext *) ssGetPWorkValue(S,0);
    if (ctx == NULL) {
        char buffer[120];
        sprintf(buffer, "Redis connection information not visible sfRedis_Derivatives");
        ssSetErrorStatus(S, buffer);
    }
    ssSetPWorkValue(S,0,NULL);
/* %%%-SFUNWIZ_wrapper_Derivatives_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Terminate function
 *
 */
void sfRedis_Terminate_wrapper(real_T *xC,
			real_T *xD,
			void **pW,
			const uint8_T *host, const int_T p_width0,
			const int32_T *port, const int_T p_width1,
			const uint8_T *passwd, const int_T p_width2,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Terminate_Changes_BEGIN --- EDIT HERE TO _END */
if (ssGetPWork(S) != NULL) {
    redisContext *ctx = (redisContext *) ssGetPWorkValue(S,0);
    if (ctx != NULL) {
        redisFree(ctx);
        ssPrintf("Disconnected!\n");
    }
    ssSetPWorkValue(S,0,NULL);
  }
/* %%%-SFUNWIZ_wrapper_Terminate_Changes_END --- EDIT HERE TO _BEGIN */
}

