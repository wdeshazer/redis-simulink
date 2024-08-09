#include <stdio.h>
#include <stdlib.h>
#include "REDIS_custom.h"
#include "hiredis/hiredis.h"


// Connects to REDIS
redisContext * REDIS_connectRedis(const char *host, int port){

    redisContext *ctx = redisConnect(host, port);
    return ctx;
}

// Disconnect from REDIS
void REDIS_redisFree(redisContext *ctx)
{
    redisFree(ctx);
}

// Send command to REDIS
redisReply * REDIS_redisCommand(redisContext *ctx, const char *cmd) {

    redisReply *reply;
    reply = (redisReply *) redisCommand(ctx, cmd);
    return reply;
}

int REDIS_redisGetReply(redisContext *ctx, void **reply){

    int status;
    status = redisGetReply(ctx, reply);
    return status;
}

int REDIS_redisGetReplyFromReader(redisContext *ctx, void **reply) {

    int status;
    status = redisGetReplyFromReader(ctx, reply);
    return status;
}

/**
 * Reconnect the given context using the saved information.
 *
 * This re-uses the exact same connect options as in the initial connection.
 * host, ip (or path), timeout and bind address are reused,
 * flags are used unmodified from the existing context.
 *
 * Returns REDIS_OK on successful connect or REDIS_ERR otherwise.
 */
int REDIS_redisReconnect(redisContext *ctx) {

    int status;
    status = redisReconnect(ctx);
    return status;
}
