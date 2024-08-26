#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hiredis.h"

// BS - BUFFER SIZE, RE - REDIS,
// MSG - MESSAGE,    CRED - CREDENTIAL
#define BSCRED        25
#define BSMSG       1000
#define ERRFILEOPEN  100
#define ERRORAUTH    200

struct redisContext;

typedef struct reStatus
{
  int status;
  char* message;
} reStatus;

typedef struct reCreds
{
  struct reStatus* err;
  char* hostname;
  char* ip;
  int port;
  char* password;
} reCreds;

extern void updateReStatus(reStatus* res, int num, const char* msg);
extern redisContext* connectRedisSrc(const char* configPath);
extern reCreds* getCredentials(const char* configPath);
