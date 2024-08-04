#include "simstruc.h"
#include "mex.h"
#include "REDIS_bus.h"
#include "redis_mex.h"


extern void sfOutputsParseResponse(SimStruct *S, redisContext *ctx, redisReply *reply, uint8_T *data, int32_T *status, uint8_T *replyType, uint32_T *numElements, uint32_T data_width, int_T tid);
extern bool sfFinished(SimStruct *S, int_T tid);
extern bool sfReceived(SimStruct *S, int_T tid);
extern bool sfStarted(SimStruct *S, int_T tid);