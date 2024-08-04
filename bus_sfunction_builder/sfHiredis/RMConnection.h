/*
 * This module exposes part of the HIREDIS API in a Simulink, MEX compatible way.
 * Of highest importance, Symulink restricts the usage of:
 * 1.  Dynamically sized strings
 *     - string buffers need to be pre-allocated
 *     - the buffers are passed to sprintf
 *     ```C
 *         static char msg[35];
 *         sprintf(msg,"Error connecting to REDIS SERVER %s:%d: %s\n",host,port,ctx->errstr);
 *         ssSetLocalErrorStatus(S,msg);
 *     ```
 * 2.  Use of `Variadic Input`
 *      - `Vararg` is short for `Variadic Arguments`
 *      - Any attempts to use functions with Variadic Input will cause an error
 *     Resolution:
 *      - Do not `#include` `hiredis.h` in the programmatic interface file `.h`
 *      - Instead `#include` them in the implementation file `.cpp`
 *
 *      This is just for the headers that will be used in Simulink and Mex.
*/
#include "hiredis.h"


struct RMConnectStatus;

extern redisContext * RMConnectRedis(const char *host, int port);
extern redisReply * RMSendCommand(redisContext *ctx, const char *cmd);
extern void RMAuthenticate(redisContext *ctx, const char *passwd);
extern void RMDisconnect(redisContext *ctx);

