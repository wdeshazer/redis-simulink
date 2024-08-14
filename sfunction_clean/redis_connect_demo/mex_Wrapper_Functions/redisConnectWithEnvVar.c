#include "hiredis.h"
#include "mex.h"

#define BUFSIZE 255
#define RELPATH '.config/redis/irad_redis.config'

extern redisContext* redisConnectWithEnvVar(char* envVar) {

    char configPath[BUFSIZE];

    // Make sure envar actually exists
    if(!getenv(envVar)){
        fprintf(stderr, "Env var %s not found.\n", envVar);
        exit(1);
    }

    snprintf(configPath, BUFSIZE, "%s/RELPATH", getenv(envVar));

    redisContext *ctx = redisConnectWithPath(configPath);
    return ctx;
}