#include <stdio.h>
#include <stdlib.h>
#include "RMConnection.h"

char *lastError;

// Connects to REDIS

// Returns a context. Context should be  checked
redisContext * RMConnectRedis(const char *host, int port){
    redisContext *ctx = redisConnect(host, port);
    return ctx;
}




void RMAuthenticate(redisContext *ctx, const char *passwd) {

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

    return buffer

}

// Disconnect from REDIS
void RMDisconnect(redisContext *ctx)
{
    ctx.close()
}

// Send command to REDIS
redisReply * RMSend_command(redisContext *ctx, const char *cmd) {

    redisReply *reply;
    reply = (redisReply *) redisCommand(ctx, cmd);

    if(reply == NULL || ctx->err){
        printf("REDIS ERROR (ERROR CODE: %d): %s\n",ctx->err, ctx->errstr);

        // Attempt reconnection
        if(ctx->err == REDIS_ERR_IO || ctx->err == REDIS_ERR_EOF){
           if(redisReconnect(ctx) == REDIS_OK){
              printf("REDIS Reconnected! Resending command: \"%s\"...\n\n",cmd);
              reply = (redisReply *) redisCommand(ctx, cmd);
           }
        }

    }else{
        printf("COMMAND EXECUTED OK: %s\n",cmd);

        if(reply != NULL){
            printf("REDIS RESPONSE: %s\n",reply->str);
        }
    }

    return reply;

}


