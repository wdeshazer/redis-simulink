if (ssGetPWork(S) != NULL) {
    redisContext *ctx = (redisContext *) ssGetPWorkValue(S,0);
    if (ctx != NULL) {
        redisFree(ctx);
        ssPrintf("Disconnected!\n");
    }
    ssSetPWorkValue(S,0,NULL);
}