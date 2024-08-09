#include "simstruc.h"

/* Forward declarations for structs defined elsewhere */
// struct redisContext;
// struct redisReply;


// Connects to REDIS
extern struct redisContext * REDIS_connectRedis(const char *host, int port);

// Disconnect from REDIS
extern void REDIS_redisFree(struct redisContext *ctx);

// Send command to REDIS
extern struct redisReply * REDIS_redisCommand(struct redisContext *ctx, const char *cmd);

extern int REDIS_redisGetReply(struct redisContext *ctx, void **reply);
extern int REDIS_redisGetReplyFromReader(struct redisContext *ctx, void **reply);

/**
 * Reconnect the given context using the saved information.
 *
 * This re-uses the exact same connect options as in the initial connection.
 * host, ip (or path), timeout and bind address are reused,
 * flags are used unmodified from the existing context.
 *
 * Returns REDIS_OK on successful connect or REDIS_ERR otherwise.
 */
extern int REDIS_redisReconnect(struct redisContext *ctx);
