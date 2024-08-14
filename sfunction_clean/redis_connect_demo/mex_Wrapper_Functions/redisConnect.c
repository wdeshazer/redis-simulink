#include "hiredis.h"
#include <stdio.h>
#include <stdlib.h>
#include "mex.h"

#define BUFSIZE 25

typedef struct redisCredentials
{
  char* hostname;
  char* ip;
  char* port;
  char* password;
  int errStatus;
} redisCredentials;


redisCredentials getCredentials(const char* configPath) {
    FILE *file;
    char ip_address[BUFSIZE], port[BUFSIZE], password[BUFSIZE];

    // Open the file in read mode
    file = fopen(configPath, "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    redisCredentials rc;

    // Read each line and store it in a separate variable
    if (fgets(rc.hostname, BUFSIZE, file) == NULL) {
        perror("Error reading hostname");
        rc.errStatus = 1;
        return rc;
    }
    if (fgets(rc.port, BUFSIZE, file) == NULL) {
        perror("Error reading port");
        rc.errStatus = 1;
        return rc;
    }
    if (fgets(rc.password, BUFSIZE, file) == NULL) {
        perror("Error reading password");
        rc.errStatus = 1;
        return rc;
    }

    // Close the file
    fclose(file);

    return rc;
}


extern redisContext* connectRedis(const char* configPath) {

  redisContext *ctx;
  redisReply *reply;
  redisCredentials rc;

  rc = getCredentials(configPath);


  if (rc.errStatus != 0) {
    ctx->err = rc.errStatus;
    return ctx;
  }

  ctx = redisConnect(rc.ip, rc.port);


  if (ctx->err == 0) {
    char *authorize = (char *)malloc(120 * sizeof(char));
    snprintf(authorize, 120, "AUTH %s", rc.password);
    reply = redisCommand(ctx, authorize);
  }

  if (  reply->str > 0){
    printf("Error Authenticating. Please check your password");
  }

}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    connectRedis(prhs);
}
