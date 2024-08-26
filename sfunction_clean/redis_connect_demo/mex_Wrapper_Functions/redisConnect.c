#include "redisConnectSrc.h"

void updateReStatus(reStatus* res, int num, const char* msg) {
    res->status = num;

    if (res->message != NULL) {
        free(res->message);
    }

    if (msg != NULL) {
        int length = strlen(msg);
        res->message = malloc(length + 1);  // Allocate memory for the string plus null terminator
        if (res->message != NULL) {
            strcpy(res->message, msg);  // Copy the string
        }
    } else {
        res->message = NULL;
    }
}

void string(char* varName, const char* fmt, const char* value) {
  char buffer[BSMSG];
  snprintf(buffer, BSMSG, fmt, value);
  strcpy(varName, value);
}


reCreds* getCredentials(const char* configPath) {
  FILE *file;
  reCreds *rc;

  // Open the file in read mode
  file = fopen(configPath, "r");
  if (file == NULL) {
    char* msg;
    string(msg, "File open error: %s\n", configPath);
    updateReStatus(rc->err, ERRFILEOPEN, msg);
    return rc;
  }

  char *fieldnames[] = {"hostname", "port", "password"};
  char *fields[3];

  // Read each line and store it in a separate variable
  int i;
  for (i=0; i<=2; i++) {
    if (fgets(fields[i], BSCRED, file) == NULL) {
      char* msg;
      string(msg, "Authentication Error: Error reading %s", fieldnames[i]);
      updateReStatus(rc->err, ERRORAUTH, msg);
      return rc;
  };

  strcpy(rc->hostname, fields[1]);
  rc->port = atoi(fields[2]);
  strcpy(rc->password, fields[3]);

  // Close the file
  fclose(file);

  return rc;

}

redisContext* connectRedisSrc(const char* configPath) {

  redisContext *ctx;
  redisCreds* rc;

  rc = getCredentials(configPath);

  if (rc->err->status != 0) {
    ctx->err = rc->res->status;
    return ctx;
  }

  ctx = redisConnect(rc->ip, rc.port);

  if (ctx->err == 0) {
    char *authorize = (char *)malloc(120 * sizeof(char));
    snprintf(authorize, 120, "AUTH %s", rc.password);
    reply = redisCommand(ctx, authorize);
  }

  if (  reply->str > 0){
    printf("Error Authenticating. Please check your password");
  }
  return ctx;
}