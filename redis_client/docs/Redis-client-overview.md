# Redis Client Overview

The Simulink-Redis Client API

## Primary API REDIS_Outputs_wrapper

### The Interface of the REDIS_Outputs_wrapper

```c
void REDIS_Outputs_wrapper(void *SS,
                          redisContext *c,
                          const uint8_T *input,
                          uint8_T *data ,
                          int32_T *status,
                          uint8_T *replyType,
                          uint32_T *numElements,
                          uint32_T data_width,
                          int_T tid)
```

### The input to the wrapper:
- SimStruc (SS)
- redisContext ( c)
- input (input) - REDIS String command

### The output to the wrapper:
- data
- status
- replyType
- numElements
- data_width
- tid

### How things connect

The SimStruc is the connection to Simulink. [REDIS.cpp](../REDIS.cpp) is the programmatic binding defining the `REDIS S-function`

The redisContext is the object storing Redis connection details. It is not thread-safe.

The input is a Null-terminated C-String containing a command. Some examples:

```redis
AUTH password
SET pi 3.14159
RPUSH session_id.service_name.pro2req 1 2 3 4 5 6 7 8 9 10 11 12
LPOP session_id.service_name.req2pro 0 -1
```

The RPUSH is representative of what the 12 voltages are

The LPOP is representative of the return values.

The numElements is variable because it depends on the return type of the REDIS command

