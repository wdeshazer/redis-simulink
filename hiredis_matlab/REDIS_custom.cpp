#include <stdio.h>
#include <stdlib.h>
#include "REDIS_custom.h"
#include "../redis_client/hiredis/hiredis.h"

char *lastError;

// Connects to REDIS
redisContext * REDIS_connectRedis(const char *host, int port){

    printf("Connecting to REDIS...\n");
    redisContext *c = redisConnect(host, port);

    if (c == NULL || c->err) {
        printf("Error connecting to REDIS SERVER %s:%d: %s\n",host,port,c->errstr);
    }else{
        printf("Connected!\n");
    }
    return c;
}


void REDIS_authenticate(redisContext *c, const char *passwd) {

    const char *cmd = "AUTH ";
    size_t size = strlen(cmd) + strlen(aString) + 1; // +1 for the null terminator
    char *buffer = (char*)malloc(size);

    if (!buffer) {
        return NULL; // Memory allocation failed
    }

    int success = snprintf(buffer, size, "%s%s", cmd, aString);

    if (success < 0) {
        free(buffer); // Clean up memory if snprintf fails
        return NULL;
    }

    return buffer;

}

// Disconnect from REDIS
void REDIS_redis_disconnect(redisContext *c)
{
    redisFree(c);
    printf("Disconnected!\n");
}

// Send command to REDIS
redisReply * REDIS_send_command(redisContext *c, const char *cmd) {

    redisReply *reply;
    reply = (redisReply *) redisCommand(c, cmd);

    if(reply == NULL || c->err){
        printf("REDIS ERROR (ERROR CODE: %d): %s\n",c->err, c->errstr);

        // Attempt reconnection
        if(c->err == REDIS_ERR_IO || c->err == REDIS_ERR_EOF){
           if(redisReconnect(c) == REDIS_OK){
              printf("REDIS Reconnected! Resending command: \"%s\"...\n\n",cmd);
              reply = (redisReply *) redisCommand(c, cmd);
           }
        }

    }else{
        printf("COMMAND EXECUTED OK: %s\n",cmd);

        if(reply != NULL){
            printf("REDIS RESPONSE: %s\n",reply->str);
        }
    }

    return reply;

}


