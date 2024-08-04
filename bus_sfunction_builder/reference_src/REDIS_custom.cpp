#include <stdio.h>
#include <stdlib.h>
#include "REDIS_custom.h"
#include "hiredis/hiredis.h"

char *lastError;

// Connects to REDIS
redisContext * connectRedis(const char *host, int port){

    printf("Connecting to REDIS...\n");
    redisContext *ctx = redisConnect(host, port);

    if (ctx == NULL || ctx->err) {
        printf("Error connecting to REDIS SERVER %s:%d: %s\n",host,port,ctx->errstr);
    }else{
        printf("Connected!\n");
    }

    return ctx;
}


void * authenticate(redisContext *ctx, const char *passwd) {

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

    redisReply *reply = sendCommand(ctx, passwd);

    return reply;

}

// Disconnect from REDIS
void disconnect(redisContext *ctx)
{
    redisFree(ctx);
    printf("Disconnected!\n");
}

// Send command to REDIS
redisReply * sendCommand(redisContext *ctx, const char *cmd) {

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


