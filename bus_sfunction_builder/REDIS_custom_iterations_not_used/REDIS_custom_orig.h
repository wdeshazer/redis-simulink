#include "simstruc.h"
#include "REDIS_bus.h"

/* Forward declarations for structs defined elsewhere */
struct redisContext;
struct redisReply;
redisOptions opt = {0};

extern redisContext * REDIS_connectRedis(const char *host, int port);
extern REDIS_authenticate(redisContext *c, const char *passwd);
extern void REDIS_redis_disconnect(redisContext *c);
extern redisReply * REDIS_send_command(redisContext *c, const char *cmd);

extern void REDIS_Outputs_parse_response(SimStruct *S, redisContext *c, redisReply *reply, uint8_T *data, int32_T *status, uint8_T *replyType, uint32_T *numElements, uint32_T data_width, int_T tid);
extern bool REDIS_finished(SimStruct *S, int_T tid);
extern bool REDIS_received(SimStruct *S, int_T tid);
extern bool REDIS_started(SimStruct *S, int_T tid);


redisOptions opt = {0};

/* One can set the endpoint with one of our helper macros */
if (tcp) {
    REDIS_OPTIONS_SET_TCP(&opt, "localhost", 6379);
} else {
    REDIS_OPTIONS_SET_UNIX(&opt, "/tmp/redis.sock");
}

/* And privdata can be specified with another helper */
REDIS_OPTIONS_SET_PRIVDATA(&opt, myPrivData, myPrivDataDtor);

/* Finally various options may be set via the `options` member, as described below */
opt->options |= REDIS_OPT_PREFER_IPV4;
