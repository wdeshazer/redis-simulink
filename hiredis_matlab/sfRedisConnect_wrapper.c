
/*
 * Include Files
 *
 */
#include "simstruc.h"



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
#include "mex.h"
#include "hiredis/hiredis.h"

redisContext *ctx;
redisReply *reply;

/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */
#define u_width 1
#define u_1_width 1
#define u_2_width 1
#define y_width 1

/*
 * Create external references here.  
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
extern redisContext * redisConnect(const char *host, int port);
extern redisContext * redisReconnect(const char *host, int port);
extern void disconnect(redisContext *ctx);
extern redisReply * sendCommand(redisContext *ctx, const char *cmd);
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Start function
 *
 */
void sfRedisConnect_Start_wrapper(real_T *xD,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Start_Changes_BEGIN --- EDIT HERE TO _END */
printf("Connecting to REDIS...\n");
    *ctx = redisConnect(host, port);

    if (ctx == NULL || ctx->err) {
        printf("Error connecting to REDIS SERVER %s:%d: %s\n",host,port,ctx->errstr);
    }else{
        printf("Connected!\n");
    }

    const char *cmd = "AUTH ";
    size_t size = strlen(cmd) + strlen(passwd) + 1; // +1 for the null terminator
    char *buffer = (char*)malloc(size);

    if (!buffer) {
        return NULL; // Memory allocation failed
    }

    int success = snprintf(buffer, size, "%s%s", cmd, passwd);

    if (success < 0) {
        free(buffer); // Clean up memory if snprintf fails
        return NULL;
    }

    reply = sendCommand(ctx, passwd);
/* %%%-SFUNWIZ_wrapper_Start_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Output function
 *
 */
void sfRedisConnect_Outputs_wrapper(const uint8_T *host,
			const uint8_T *port,
			const uint8_T *passwd,
			real_T *y0,
			const real_T *xD,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */
 
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Updates function
 *
 */
void sfRedisConnect_Update_wrapper(const uint8_T *host,
			const uint8_T *port,
			const uint8_T *passwd,
			real_T *y0,
			real_T *xD,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Update_Changes_BEGIN --- EDIT HERE TO _END */
 
/* %%%-SFUNWIZ_wrapper_Update_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Terminate function
 *
 */
void sfRedisConnect_Terminate_wrapper(real_T *xD,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Terminate_Changes_BEGIN --- EDIT HERE TO _END */
redisFree(ctx);
    printf("Disconnected!\n");
/* %%%-SFUNWIZ_wrapper_Terminate_Changes_END --- EDIT HERE TO _BEGIN */
}

