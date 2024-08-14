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

extern redisContext *ctx redisConnectWindows() {
  redisGetPathWithEnvVar()
}

extern redisContext *ctx redisConnect(isWindows, const char* configPath) {
  FILE *fptr;

  char *cp = ""

  if (strcmp(configPath, 'default') == 0){

  }

  // Open a file in read mode
  fptr = fopen("filename.txt", "r");


}


void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    redis()
}
