
/*
 * Include Files
 *
 */
#include "simstruc.h"



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
#include "mex.h"
#include "REDIS_custom.h"
#include "hiredis/hiredis.h"

redisContext *ctx;
redisReply *reply;
redisOptions *connOpts;d

/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 1
#define u_1_width 1
#define u_2_width 1

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
extern redisContext * redisConnect(const char *host, int port);
extern redisContext * redisReconnect(const char *host, int port);
extern void disconnect(redisContext *c);
extern redisReply * sendCommand(redisContext *c, const char *cmd);

extern void parseResponse(SimStruct *S, redisContext *c, redisReply *reply, uint8_T *data, int32_T *status, uint8_T *replyType, uint32_T *numElements, uint32_T data_width, int_T tid);
extern bool finished(SimStruct *S, int_T tid);
extern bool received(SimStruct *S, int_T tid);
extern bool started(SimStruct *S, int_T tid);
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Start function
 *
 */
void redis_Start_wrapper(real_T *xD,
			void **pW,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Start_Changes_BEGIN --- EDIT HERE TO _END */
    printf("Connecting to REDIS...\n");
    redisContext *c = redisConnect(host, port);

    if (c == NULL || c->err) {
        printf("Error connecting to REDIS SERVER %s:%d: %s\n",host,port,c->errstr);
    }else{
        printf("Connected!\n");
    }

    const char *cmd = "AUTH ";
    size_t size = strlen(cmd) + strlen(aString) + 1; // +1 for the null terminator
    char *buffer = (char*)malloc(size);

    if (!buffer) {
        return NULL; // Memory allocation failed
    }

    int success = snprintf(buffer, size, "%s%s", cmd, passwd);

    if (success < 0) {
        free(buffer); // Clean up memory if snprintf fails
        return NULL;
    }

    reply = sendCommand(ctx, 

    return c;
/* %%%-SFUNWIZ_wrapper_Start_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Output function
 *
 */
void redis_Outputs_wrapper(const real_T *u0,
			const real_T *u1,
			const real_T *u2,
			const real_T *xD,
			void **pW,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
/* This sample sets the output equal to the input
      y0[0] = u0[0]; 
 For complex signals use: y0[0].re = u0[0].re; 
      y0[0].im = u0[0].im;
      y1[0].re = u1[0].re;
      y1[0].im = u1[0].im;
 */
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Updates function
 *
 */
void redis_Update_wrapper(const real_T *u0,
			const real_T *u1,
			const real_T *u2,
			real_T *xD,
			void **pW,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
 
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}

