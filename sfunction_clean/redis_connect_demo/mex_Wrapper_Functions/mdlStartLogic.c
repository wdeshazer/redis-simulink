#include "simstruc.h"

/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
#include "mex.h"
#include "hiredis.h"

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
        pW[0] = ctx;
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
        // 261:     char errstr[128]; /* String representation of error when applicable */
        int n_host = 253, n_port = 4, REDIS_ERR_LENGTH = 128, NULL_LENGTH = 1;
        int n_err_msg = nmsg_main + REDIS_ERR_LENGTH + n_host + n_port + NULL_LENGTH;

        size_t size=n_err_msg;
        char *buffer = (char*)malloc(size);

        sprintf(buffer, fmt, host, port, ctx->errstr);
        ssSetErrorStatus(S, buffer);