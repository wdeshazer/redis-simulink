#ifndef __HIREDIS_H
#define __HIREDIS_H
#include "read.h"

// Matlab Mex does not allow variadic input
#ifndef _MATLAB_MEX
#include <stdarg.h> /* for va_list */
#endif

#ifndef _MSC_VER
#include <sys/time.h> /* for struct timeval */
#else
struct timeval; /* forward declaration */
typedef long long ssize_t;
#endif

#include <stdint.h> /* uintXX_t, etc */
#include "sds.h" /* for sds */
#include "alloc.h" /* for allocation wrappers */
#include "net.h"

#define HIREDIS_MAJOR 1
#define HIREDIS_MINOR 2
#define HIREDIS_PATCH 0
#define HIREDIS_SONAME 1.2.1-dev

/* Connection type can be blocking or non-blocking and is set in the
 * least significant bit of the flags field in redisContext. */
#define REDIS_BLOCK 0x1

/* Connection may be disconnected before being free'd. The second bit
 * in the flags field is set when the context is connected. */
#define REDIS_CONNECTED 0x2

/* The async API might try to disconnect cleanly and flush the output
 * buffer and read all subsequent replies before disconnecting.
 * This flag means no new commands can come in and the connection
 * should be terminated once all replies have been read. */
#define REDIS_DISCONNECTING 0x4

/* Flag specific to the async API which means that the context should be clean
 * up as soon as possible. */
#define REDIS_FREEING 0x8

/* Flag that is set when an async callback is executed. */
#define REDIS_IN_CALLBACK 0x10

/* Flag that is set when the async context has one or more subscriptions. */
#define REDIS_SUBSCRIBED 0x20

/* Flag that is set when monitor mode is active */
#define REDIS_MONITORING 0x40

/* Flag that is set when we should set SO_REUSEADDR before calling bind() */
#define REDIS_REUSEADDR 0x80

/* Flag that is set when the async connection supports push replies. */
#define REDIS_SUPPORTS_PUSH 0x100

/**
 * Flag that indicates the user does not want the context to
 * be automatically freed upon error
 */
#define REDIS_NO_AUTO_FREE 0x200

/* Flag that indicates the user does not want replies to be automatically freed */
#define REDIS_NO_AUTO_FREE_REPLIES 0x400

/* Flags to prefer IPv6 or IPv4 when doing DNS lookup. (If both are set,
 * AF_UNSPEC is used.) */
#define REDIS_PREFER_IPV4 0x800
#define REDIS_PREFER_IPV6 0x1000

#define REDIS_KEEPALIVE_INTERVAL 15 /* seconds */

/* number of times we retry to connect in the case of EADDRNOTAVAIL and
 * SO_REUSEADDR is being used. */
#define REDIS_CONNECT_RETRIES  10

/* Forward declarations for structs defined elsewhere */
struct redisAsyncContext;
struct redisContext;

/* RESP3 push helpers and callback prototypes */
#define redisIsPushReply(r) (((redisReply*)(r))->type == REDIS_REPLY_PUSH)
typedef void (redisPushFn)(void *, void *);
typedef void (redisAsyncPushFn)(struct redisAsyncContext *, void *);

// region C++---------------------------------------------------------------
#ifdef __cplusplus
extern "C" {
#endif

/* This is the reply object returned by redisCommand() */
typedef struct redisReply {
    int type; /* REDIS_REPLY_* */
    long long integer; /* The integer when type is REDIS_REPLY_INTEGER */
    double dval; /* The double when type is REDIS_REPLY_DOUBLE */
    size_t len; /* Length of string */
    char *str; /* Used for REDIS_REPLY_ERROR, REDIS_REPLY_STRING
                  REDIS_REPLY_VERB, REDIS_REPLY_DOUBLE (in additional to dval),
                  and REDIS_REPLY_BIGNUM. */
    char vtype[4]; /* Used for REDIS_REPLY_VERB, contains the null
                      terminated 3 character content type, such as "txt". */
    size_t elements; /* number of elements, for REDIS_REPLY_ARRAY */
    struct redisReply **element; /* elements vector for REDIS_REPLY_ARRAY */
} redisReply;

redisReader *redisReaderCreate(void);

/* Function to free the reply objects hiredis returns by default. */
void freeReplyObject(void *reply);

/* Functions to format a command according to the protocol. */
int redisvFormatCommand(char **target, const char *format, va_list ap);
int redisFormatCommand(char **target, const char *format, ...);
long long redisFormatCommandArgv(char **target, int argc, const char **argv, const size_t *argvlen);
long long redisFormatSdsCommandArgv(sds *target, int argc, const char ** argv, const size_t *argvlen);
void redisFreeCommand(char *cmd);
void redisFreeSdsCommand(sds cmd);

enum redisConnectionType {
    REDIS_CONN_TCP,
    REDIS_CONN_UNIX,
    REDIS_CONN_USERFD
};

struct redisSsl;

#define REDIS_OPT_NONBLOCK 0x01
#define REDIS_OPT_REUSEADDR 0x02
#define REDIS_OPT_NOAUTOFREE 0x04        /* Don't automatically free the async
                                          * object on a connection failure, or
                                          * other implicit conditions. Only free
                                          * on an explicit call to disconnect()
                                          * or free() */
#define REDIS_OPT_NO_PUSH_AUTOFREE 0x08  /* Don't automatically intercept and
                                          * free RESP3 PUSH replies. */
#define REDIS_OPT_NOAUTOFREEREPLIES 0x10 /* Don't automatically free replies. */
#define REDIS_OPT_PREFER_IPV4 0x20       /* Prefer IPv4 in DNS lookups. */
#define REDIS_OPT_PREFER_IPV6 0x40       /* Prefer IPv6 in DNS lookups. */
#define REDIS_OPT_PREFER_IP_UNSPEC (REDIS_OPT_PREFER_IPV4 | REDIS_OPT_PREFER_IPV6)

/* In Unix systems a file descriptor is a regular signed int, with -1
 * representing an invalid descriptor. In Windows it is a SOCKET
 * (32- or 64-bit unsigned integer depending on the architecture), where
 * all bits set (~0) is INVALID_SOCKET.  */
#ifndef _WIN32
typedef int redisFD;
#define REDIS_INVALID_FD -1
#else
#ifdef _WIN64
typedef unsigned long long redisFD; /* SOCKET = 64-bit UINT_PTR */
#else
typedef unsigned long redisFD;      /* SOCKET = 32-bit UINT_PTR */
#endif
#define REDIS_INVALID_FD ((redisFD)(~0)) /* INVALID_SOCKET */
#endif

typedef struct {
    /*
     * the type of connection to use. This also indicates which
     * `endpoint` member field to use
     */
    int type;
    /* bit field of REDIS_OPT_xxx */
    int options;
    /* timeout value for connect operation. If NULL, no timeout is used */
    const struct timeval *connect_timeout;
    /* timeout value for commands. If NULL, no timeout is used.  This can be
     * updated at runtime with redisSetTimeout/redisAsyncSetTimeout. */
    const struct timeval *command_timeout;
    union {
        /** use this field for tcp/ip connections */
        struct {
            const char *source_addr;
            const char *ip;
            int port;
        } tcp;
        /** use this field for unix domain sockets */
        const char *unix_socket;
        /**
         * use this field to have hiredis operate an already-open
         * file descriptor */
        redisFD fd;
    } endpoint;

    /* Optional user defined data/destructor */
    void *privdata;
    void (*free_privdata)(void *);

    /* A user defined PUSH message callback */
    redisPushFn *push_cb;
    redisAsyncPushFn *async_push_cb;
} redisOptions;

/**
 * Helper macros to initialize options to their specified fields.
 */
#define REDIS_OPTIONS_SET_TCP(opts, ip_, port_) do { \
        (opts)->type = REDIS_CONN_TCP;               \
        (opts)->endpoint.tcp.ip = ip_;               \
        (opts)->endpoint.tcp.port = port_;           \
    } while(0)

#define REDIS_OPTIONS_SET_UNIX(opts, path) do { \
        (opts)->type = REDIS_CONN_UNIX;         \
        (opts)->endpoint.unix_socket = path;    \
    } while(0)

#define REDIS_OPTIONS_SET_PRIVDATA(opts, data, dtor) do {  \
        (opts)->privdata = data;                           \
        (opts)->free_privdata = dtor;                      \
    } while(0)

typedef struct redisContextFuncs {
    void (*close)(struct redisContext *);
    void (*free_privctx)(void *);
    void (*async_read)(struct redisAsyncContext *);
    void (*async_write)(struct redisAsyncContext *);

    /* Read/Write data to the underlying communication stream, returning the
     * number of bytes read/written.  In the event of an unrecoverable error
     * these functions shall return a value < 0.  In the event of a
     * recoverable error, they should return 0. */
    ssize_t (*read)(struct redisContext *, char *, size_t);
    ssize_t (*write)(struct redisContext *);
} redisContextFuncs;


/* Context for a connection to Redis */
typedef struct redisContext {
    const redisContextFuncs *funcs;   /* Function table */

    int err; /* Error flags, 0 when there is no error */
    char errstr[128]; /* String representation of error when applicable */
    redisFD fd;
    int flags;
    char *obuf; /* Write buffer */
    redisReader *reader; /* Protocol reader */

    enum redisConnectionType connection_type;
    struct timeval *connect_timeout;
    struct timeval *command_timeout;

    struct {
        char *host;
        char *source_addr;
        int port;
    } tcp;

    struct {
        char *path;
    } unix_sock;

    /* For non-blocking connect */
    struct sockaddr *saddr;
    size_t addrlen;

    /* Optional data and corresponding destructor users can use to provide
     * context to a given redisContext.  Not used by hiredis. */
    void *privdata;
    void (*free_privdata)(void *);

    /* Internal context pointer presently used by hiredis to manage
     * SSL connections. */
    void *privctx;

    /* An optional RESP3 PUSH handler */
    redisPushFn *push_cb;
} redisContext;

redisContext *redisConnectWithOptions(const redisOptions *options);
redisContext *redisConnect(const char *ip, int port);
redisContext *redisConnectWithTimeout(const char *ip, int port, const struct timeval tv);
redisContext *redisConnectNonBlock(const char *ip, int port);
redisContext *redisConnectBindNonBlock(const char *ip, int port,
                                       const char *source_addr);
redisContext *redisConnectBindNonBlockWithReuse(const char *ip, int port,
                                                const char *source_addr);
redisContext *redisConnectUnix(const char *path);
redisContext *redisConnectUnixWithTimeout(const char *path, const struct timeval tv);
redisContext *redisConnectUnixNonBlock(const char *path);
redisContext *redisConnectFd(redisFD fd);

/**
 * Reconnect the given context using the saved information.
 *
 * This re-uses the exact same connect options as in the initial connection.
 * host, ip (or path), timeout and bind address are reused,
 * flags are used unmodified from the existing context.
 *
 * Returns REDIS_OK on successful connect or REDIS_ERR otherwise.
 */
int redisReconnect(redisContext *c);

redisPushFn *redisSetPushCallback(redisContext *c, redisPushFn *fn);
int redisSetTimeout(redisContext *c, const struct timeval tv);
int redisEnableKeepAlive(redisContext *c);
int redisEnableKeepAliveWithInterval(redisContext *c, int interval);
int redisSetTcpUserTimeout(redisContext *c, unsigned int timeout);
void redisFree(redisContext *c);
redisFD redisFreeKeepFd(redisContext *c);
int redisBufferRead(redisContext *c);
int redisBufferWrite(redisContext *c, int *done);

/* In a blocking context, this function first checks if there are unconsumed
 * replies to return and returns one if so. Otherwise, it flushes the output
 * buffer to the socket and reads until it has a reply. In a non-blocking
 * context, it will return unconsumed replies until there are no more. */
int redisGetReply(redisContext *c, void **reply);
int redisGetReplyFromReader(redisContext *c, void **reply);

/* Write a formatted command to the output buffer. Use these functions in blocking mode
 * to get a pipeline of commands. */
int redisAppendFormattedCommand(redisContext *c, const char *cmd, size_t len);

/* Write a command to the output buffer. Use these functions in blocking mode
 * to get a pipeline of commands. */
int redisvAppendCommand(redisContext *c, const char *format, va_list ap);
int redisAppendCommand(redisContext *c, const char *format, ...);
int redisAppendCommandArgv(redisContext *c, int argc, const char **argv, const size_t *argvlen);

/* Issue a command to Redis. In a blocking context, it is identical to calling
 * redisAppendCommand, followed by redisGetReply. The function will return
 * NULL if there was an error in performing the request, otherwise it will
 * return the reply. In a non-blocking context, it is identical to calling
 * only redisAppendCommand and will always return NULL. */
void *redisvCommand(redisContext *c, const char *format, va_list ap);
void *redisCommand(redisContext *c, const char *format, ...);
void *redisCommandArgv(redisContext *c, int argc, const char **argv, const size_t *argvlen);

#ifdef __cplusplus
}
#endif

#endif

// end region C++---------------------------------------------------------------


// Beginning of original hederfile
extern int redisContextUpdateConnectTimeout(redisContext *c, const struct timeval *timeout);
extern int redisContextUpdateCommandTimeout(redisContext *c, const struct timeval *timeout);

static redisContextFuncs redisContextDefaultFuncs = {
    .close = redisNetClose,
    .free_privctx = NULL,
    .async_read = redisAsyncRead,
    .async_write = redisAsyncWrite,
    .read = redisNetRead,
    .write = redisNetWrite
};

static redisReply *createReplyObject(int type);
static void *createStringObject(const redisReadTask *task, char *str, size_t len);
static void *createArrayObject(const redisReadTask *task, size_t elements);
static void *createIntegerObject(const redisReadTask *task, long long value);
static void *createDoubleObject(const redisReadTask *task, double value, char *str, size_t len);
static void *createNilObject(const redisReadTask *task);
static void *createBoolObject(const redisReadTask *task, int bval);

/* Default set of functions to build the reply. Keep in mind that such a
 * function returning NULL is interpreted as OOM. */
static redisReplyObjectFunctions defaultFunctions = {
    createStringObject,
    createArrayObject,
    createIntegerObject,
    createDoubleObject,
    createNilObject,
    createBoolObject,
    freeReplyObject
};

/* Create a reply object */
static redisReply *createReplyObject(int type) {
    redisReply *r = hi_calloc(1,sizeof(*r));

    if (r == NULL)
        return NULL;

    r->type = type;
    return r;
}

/* Free a reply object */
void freeReplyObject(void *reply) {
    redisReply *r = reply;
    size_t j;

    if (r == NULL)
        return;

    switch(r->type) {
    case REDIS_REPLY_INTEGER:
    case REDIS_REPLY_NIL:
    case REDIS_REPLY_BOOL:
        break; /* Nothing to free */
    case REDIS_REPLY_ARRAY:
    case REDIS_REPLY_MAP:
    case REDIS_REPLY_ATTR:
    case REDIS_REPLY_SET:
    case REDIS_REPLY_PUSH:
        if (r->element != NULL) {
            for (j = 0; j < r->elements; j++)
                freeReplyObject(r->element[j]);
            hi_free(r->element);
        }
        break;
    case REDIS_REPLY_ERROR:
    case REDIS_REPLY_STATUS:
    case REDIS_REPLY_STRING:
    case REDIS_REPLY_DOUBLE:
    case REDIS_REPLY_VERB:
    case REDIS_REPLY_BIGNUM:
        hi_free(r->str);
        break;
    }
    hi_free(r);
}

static void *createStringObject(const redisReadTask *task, char *str, size_t len) {
    redisReply *r, *parent;
    char *buf;

    r = createReplyObject(task->type);
    if (r == NULL)
        return NULL;

    assert(task->type == REDIS_REPLY_ERROR  ||
           task->type == REDIS_REPLY_STATUS ||
           task->type == REDIS_REPLY_STRING ||
           task->type == REDIS_REPLY_VERB   ||
           task->type == REDIS_REPLY_BIGNUM);

    /* Copy string value */
    if (task->type == REDIS_REPLY_VERB) {
        buf = hi_malloc(len-4+1); /* Skip 4 bytes of verbatim type header. */
        if (buf == NULL) goto oom;

        memcpy(r->vtype,str,3);
        r->vtype[3] = '\0';
        memcpy(buf,str+4,len-4);
        buf[len-4] = '\0';
        r->len = len - 4;
    } else {
        buf = hi_malloc(len+1);
        if (buf == NULL) goto oom;

        memcpy(buf,str,len);
        buf[len] = '\0';
        r->len = len;
    }
    r->str = buf;

    if (task->parent) {
        parent = task->parent->obj;
        assert(parent->type == REDIS_REPLY_ARRAY ||
               parent->type == REDIS_REPLY_MAP ||
               parent->type == REDIS_REPLY_ATTR ||
               parent->type == REDIS_REPLY_SET ||
               parent->type == REDIS_REPLY_PUSH);
        parent->element[task->idx] = r;
    }
    return r;

oom:
    freeReplyObject(r);
    return NULL;
}

static void *createArrayObject(const redisReadTask *task, size_t elements) {
    redisReply *r, *parent;

    r = createReplyObject(task->type);
    if (r == NULL)
        return NULL;

    if (elements > 0) {
        r->element = hi_calloc(elements,sizeof(redisReply*));
        if (r->element == NULL) {
            freeReplyObject(r);
            return NULL;
        }
    }

    r->elements = elements;

    if (task->parent) {
        parent = task->parent->obj;
        assert(parent->type == REDIS_REPLY_ARRAY ||
               parent->type == REDIS_REPLY_MAP ||
               parent->type == REDIS_REPLY_ATTR ||
               parent->type == REDIS_REPLY_SET ||
               parent->type == REDIS_REPLY_PUSH);
        parent->element[task->idx] = r;
    }
    return r;
}

static void *createIntegerObject(const redisReadTask *task, long long value) {
    redisReply *r, *parent;

    r = createReplyObject(REDIS_REPLY_INTEGER);
    if (r == NULL)
        return NULL;

    r->integer = value;

    if (task->parent) {
        parent = task->parent->obj;
        assert(parent->type == REDIS_REPLY_ARRAY ||
               parent->type == REDIS_REPLY_MAP ||
               parent->type == REDIS_REPLY_ATTR ||
               parent->type == REDIS_REPLY_SET ||
               parent->type == REDIS_REPLY_PUSH);
        parent->element[task->idx] = r;
    }
    return r;
}

static void *createDoubleObject(const redisReadTask *task, double value, char *str, size_t len) {
    redisReply *r, *parent;

    if (len == SIZE_MAX) // Prevents hi_malloc(0) if len equals to SIZE_MAX
        return NULL;

    r = createReplyObject(REDIS_REPLY_DOUBLE);
    if (r == NULL)
        return NULL;

    r->dval = value;
    r->str = hi_malloc(len+1);
    if (r->str == NULL) {
        freeReplyObject(r);
        return NULL;
    }

    /* The double reply also has the original protocol string representing a
     * double as a null terminated string. This way the caller does not need
     * to format back for string conversion, especially since Redis does efforts
     * to make the string more human readable avoiding the calssical double
     * decimal string conversion artifacts. */
    memcpy(r->str, str, len);
    r->str[len] = '\0';
    r->len = len;

    if (task->parent) {
        parent = task->parent->obj;
        assert(parent->type == REDIS_REPLY_ARRAY ||
               parent->type == REDIS_REPLY_MAP ||
               parent->type == REDIS_REPLY_ATTR ||
               parent->type == REDIS_REPLY_SET ||
               parent->type == REDIS_REPLY_PUSH);
        parent->element[task->idx] = r;
    }
    return r;
}

static void *createNilObject(const redisReadTask *task) {
    redisReply *r, *parent;

    r = createReplyObject(REDIS_REPLY_NIL);
    if (r == NULL)
        return NULL;

    if (task->parent) {
        parent = task->parent->obj;
        assert(parent->type == REDIS_REPLY_ARRAY ||
               parent->type == REDIS_REPLY_MAP ||
               parent->type == REDIS_REPLY_ATTR ||
               parent->type == REDIS_REPLY_SET ||
               parent->type == REDIS_REPLY_PUSH);
        parent->element[task->idx] = r;
    }
    return r;
}

static void *createBoolObject(const redisReadTask *task, int bval) {
    redisReply *r, *parent;

    r = createReplyObject(REDIS_REPLY_BOOL);
    if (r == NULL)
        return NULL;

    r->integer = bval != 0;

    if (task->parent) {
        parent = task->parent->obj;
        assert(parent->type == REDIS_REPLY_ARRAY ||
               parent->type == REDIS_REPLY_MAP ||
               parent->type == REDIS_REPLY_ATTR ||
               parent->type == REDIS_REPLY_SET ||
               parent->type == REDIS_REPLY_PUSH);
        parent->element[task->idx] = r;
    }
    return r;
}

/* Return the number of digits of 'v' when converted to string in radix 10.
 * Implementation borrowed from link in redis/src/util.c:string2ll(). */
static uint32_t countDigits(uint64_t v) {
  uint32_t result = 1;
  for (;;) {
    if (v < 10) return result;
    if (v < 100) return result + 1;
    if (v < 1000) return result + 2;
    if (v < 10000) return result + 3;
    v /= 10000U;
    result += 4;
  }
}

/* Helper that calculates the bulk length given a certain string length. */
static size_t bulklen(size_t len) {
    return 1+countDigits(len)+2+len+2;
}

int redisvFormatCommand(char **target, const char *format, va_list ap) {
    const char *c = format;
    char *cmd = NULL; /* final command */
    int pos; /* position in final command */
    sds curarg, newarg; /* current argument */
    int touched = 0; /* was the current argument touched? */
    char **curargv = NULL, **newargv = NULL;
    int argc = 0;
    int totlen = 0;
    int error_type = 0; /* 0 = no error; -1 = memory error; -2 = format error */
    int j;

    /* Abort if there is not target to set */
    if (target == NULL)
        return -1;

    /* Build the command string accordingly to protocol */
    curarg = sdsempty();
    if (curarg == NULL)
        return -1;

    while(*c != '\0') {
        if (*c != '%' || c[1] == '\0') {
            if (*c == ' ') {
                if (touched) {
                    newargv = hi_realloc(curargv,sizeof(char*)*(argc+1));
                    if (newargv == NULL) goto memory_err;
                    curargv = newargv;
                    curargv[argc++] = curarg;
                    totlen += bulklen(sdslen(curarg));

                    /* curarg is put in argv so it can be overwritten. */
                    curarg = sdsempty();
                    if (curarg == NULL) goto memory_err;
                    touched = 0;
                }
            } else {
                newarg = sdscatlen(curarg,c,1);
                if (newarg == NULL) goto memory_err;
                curarg = newarg;
                touched = 1;
            }
        } else {
            char *arg;
            size_t size;

            /* Set newarg so it can be checked even if it is not touched. */
            newarg = curarg;

            switch(c[1]) {
            case 's':
                arg = va_arg(ap,char*);
                size = strlen(arg);
                if (size > 0)
                    newarg = sdscatlen(curarg,arg,size);
                break;
            case 'b':
                arg = va_arg(ap,char*);
                size = va_arg(ap,size_t);
                if (size > 0)
                    newarg = sdscatlen(curarg,arg,size);
                break;
            case '%':
                newarg = sdscat(curarg,"%");
                break;
            default:
                /* Try to detect printf format */
                {
                    static const char intfmts[] = "diouxX";
                    static const char flags[] = "#0-+ ";
                    char _format[16];
                    const char *_p = c+1;
                    size_t _l = 0;
                    va_list _cpy;

                    /* Flags */
                    while (*_p != '\0' && strchr(flags,*_p) != NULL) _p++;

                    /* Field width */
                    while (*_p != '\0' && isdigit((int) *_p)) _p++;

                    /* Precision */
                    if (*_p == '.') {
                        _p++;
                        while (*_p != '\0' && isdigit((int) *_p)) _p++;
                    }

                    /* Copy va_list before consuming with va_arg */
                    va_copy(_cpy,ap);

                    /* Make sure we have more characters otherwise strchr() accepts
                     * '\0' as an integer specifier. This is checked after above
                     * va_copy() to avoid UB in fmt_invalid's call to va_end(). */
                    if (*_p == '\0') goto fmt_invalid;

                    /* Integer conversion (without modifiers) */
                    if (strchr(intfmts,*_p) != NULL) {
                        va_arg(ap,int);
                        goto fmt_valid;
                    }

                    /* Double conversion (without modifiers) */
                    if (strchr("eEfFgGaA",*_p) != NULL) {
                        va_arg(ap,double);
                        goto fmt_valid;
                    }

                    /* Size: char */
                    if (_p[0] == 'h' && _p[1] == 'h') {
                        _p += 2;
                        if (*_p != '\0' && strchr(intfmts,*_p) != NULL) {
                            va_arg(ap,int); /* char gets promoted to int */
                            goto fmt_valid;
                        }
                        goto fmt_invalid;
                    }

                    /* Size: short */
                    if (_p[0] == 'h') {
                        _p += 1;
                        if (*_p != '\0' && strchr(intfmts,*_p) != NULL) {
                            va_arg(ap,int); /* short gets promoted to int */
                            goto fmt_valid;
                        }
                        goto fmt_invalid;
                    }

                    /* Size: long long */
                    if (_p[0] == 'l' && _p[1] == 'l') {
                        _p += 2;
                        if (*_p != '\0' && strchr(intfmts,*_p) != NULL) {
                            va_arg(ap,long long);
                            goto fmt_valid;
                        }
                        goto fmt_invalid;
                    }

                    /* Size: long */
                    if (_p[0] == 'l') {
                        _p += 1;
                        if (*_p != '\0' && strchr(intfmts,*_p) != NULL) {
                            va_arg(ap,long);
                            goto fmt_valid;
                        }
                        goto fmt_invalid;
                    }

                fmt_invalid:
                    va_end(_cpy);
                    goto format_err;

                fmt_valid:
                    _l = (_p+1)-c;
                    if (_l < sizeof(_format)-2) {
                        memcpy(_format,c,_l);
                        _format[_l] = '\0';
                        newarg = sdscatvprintf(curarg,_format,_cpy);

                        /* Update current position (note: outer blocks
                         * increment c twice so compensate here) */
                        c = _p-1;
                    }

                    va_end(_cpy);
                    break;
                }
            }

            if (newarg == NULL) goto memory_err;
            curarg = newarg;

            touched = 1;
            c++;
            if (*c == '\0')
                break;
        }
        c++;
    }

    /* Add the last argument if needed */
    if (touched) {
        newargv = hi_realloc(curargv,sizeof(char*)*(argc+1));
        if (newargv == NULL) goto memory_err;
        curargv = newargv;
        curargv[argc++] = curarg;
        totlen += bulklen(sdslen(curarg));
    } else {
        sdsfree(curarg);
    }

    /* Clear curarg because it was put in curargv or was free'd. */
    curarg = NULL;

    /* Add bytes needed to hold multi bulk count */
    totlen += 1+countDigits(argc)+2;

    /* Build the command at protocol level */
    cmd = hi_malloc(totlen+1);
    if (cmd == NULL) goto memory_err;

    pos = sprintf(cmd,"*%d\r\n",argc);
    for (j = 0; j < argc; j++) {
        pos += sprintf(cmd+pos,"$%zu\r\n",sdslen(curargv[j]));
        memcpy(cmd+pos,curargv[j],sdslen(curargv[j]));
        pos += sdslen(curargv[j]);
        sdsfree(curargv[j]);
        cmd[pos++] = '\r';
        cmd[pos++] = '\n';
    }
    assert(pos == totlen);
    cmd[pos] = '\0';

    hi_free(curargv);
    *target = cmd;
    return totlen;

format_err:
    error_type = -2;
    goto cleanup;

memory_err:
    error_type = -1;
    goto cleanup;

cleanup:
    if (curargv) {
        while(argc--)
            sdsfree(curargv[argc]);
        hi_free(curargv);
    }

    sdsfree(curarg);
    hi_free(cmd);

    return error_type;
}

/* Format a command according to the Redis protocol. This function
 * takes a format similar to printf:
 *
 * %s represents a C null terminated string you want to interpolate
 * %b represents a binary safe string
 *
 * When using %b you need to provide both the pointer to the string
 * and the length in bytes as a size_t. Examples:
 *
 * len = redisFormatCommand(target, "GET %s", mykey);
 * len = redisFormatCommand(target, "SET %s %b", mykey, myval, myvallen);
 */
int redisFormatCommand(char **target, const char *format, ...) {
    va_list ap;
    int len;
    va_start(ap,format);
    len = redisvFormatCommand(target,format,ap);
    va_end(ap);

    /* The API says "-1" means bad result, but we now also return "-2" in some
     * cases.  Force the return value to always be -1. */
    if (len < 0)
        len = -1;

    return len;
}

/* Format a command according to the Redis protocol using an sds string and
 * sdscatfmt for the processing of arguments. This function takes the
 * number of arguments, an array with arguments and an array with their
 * lengths. If the latter is set to NULL, strlen will be used to compute the
 * argument lengths.
 */
long long redisFormatSdsCommandArgv(sds *target, int argc, const char **argv,
                                    const size_t *argvlen)
{
    sds cmd, aux;
    unsigned long long totlen, len;
    int j;

    /* Abort on a NULL target */
    if (target == NULL)
        return -1;

    /* Calculate our total size */
    totlen = 1+countDigits(argc)+2;
    for (j = 0; j < argc; j++) {
        len = argvlen ? argvlen[j] : strlen(argv[j]);
        totlen += bulklen(len);
    }

    /* Use an SDS string for command construction */
    cmd = sdsempty();
    if (cmd == NULL)
        return -1;

    /* We already know how much storage we need */
    aux = sdsMakeRoomFor(cmd, totlen);
    if (aux == NULL) {
        sdsfree(cmd);
        return -1;
    }

    cmd = aux;

    /* Construct command */
    cmd = sdscatfmt(cmd, "*%i\r\n", argc);
    for (j=0; j < argc; j++) {
        len = argvlen ? argvlen[j] : strlen(argv[j]);
        cmd = sdscatfmt(cmd, "$%U\r\n", len);
        cmd = sdscatlen(cmd, argv[j], len);
        cmd = sdscatlen(cmd, "\r\n", sizeof("\r\n")-1);
    }

    assert(sdslen(cmd)==totlen);

    *target = cmd;
    return totlen;
}

void redisFreeSdsCommand(sds cmd) {
    sdsfree(cmd);
}

/* Format a command according to the Redis protocol. This function takes the
 * number of arguments, an array with arguments and an array with their
 * lengths. If the latter is set to NULL, strlen will be used to compute the
 * argument lengths.
 */
long long redisFormatCommandArgv(char **target, int argc, const char **argv, const size_t *argvlen) {
    char *cmd = NULL; /* final command */
    size_t pos; /* position in final command */
    size_t len, totlen;
    int j;

    /* Abort on a NULL target */
    if (target == NULL)
        return -1;

    /* Calculate number of bytes needed for the command */
    totlen = 1+countDigits(argc)+2;
    for (j = 0; j < argc; j++) {
        len = argvlen ? argvlen[j] : strlen(argv[j]);
        totlen += bulklen(len);
    }

    /* Build the command at protocol level */
    cmd = hi_malloc(totlen+1);
    if (cmd == NULL)
        return -1;

    pos = sprintf(cmd,"*%d\r\n",argc);
    for (j = 0; j < argc; j++) {
        len = argvlen ? argvlen[j] : strlen(argv[j]);
        pos += sprintf(cmd+pos,"$%zu\r\n",len);
        memcpy(cmd+pos,argv[j],len);
        pos += len;
        cmd[pos++] = '\r';
        cmd[pos++] = '\n';
    }
    assert(pos == totlen);
    cmd[pos] = '\0';

    *target = cmd;
    return totlen;
}

void redisFreeCommand(char *cmd) {
    hi_free(cmd);
}

void __redisSetError(redisContext *c, int type, const char *str) {
    size_t len;

    c->err = type;
    if (str != NULL) {
        len = strlen(str);
        len = len < (sizeof(c->errstr)-1) ? len : (sizeof(c->errstr)-1);
        memcpy(c->errstr,str,len);
        c->errstr[len] = '\0';
    } else {
        /* Only REDIS_ERR_IO may lack a description! */
        assert(type == REDIS_ERR_IO);
        strerror_r(errno, c->errstr, sizeof(c->errstr));
    }
}

redisReader *redisReaderCreate(void) {
    return redisReaderCreateWithFunctions(&defaultFunctions);
}

static void redisPushAutoFree(void *privdata, void *reply) {
    (void)privdata;
    freeReplyObject(reply);
}

static redisContext *redisContextInit(void) {
    redisContext *c;

    c = hi_calloc(1, sizeof(*c));
    if (c == NULL)
        return NULL;

    c->funcs = &redisContextDefaultFuncs;

    c->obuf = sdsempty();
    c->reader = redisReaderCreate();
    c->fd = REDIS_INVALID_FD;

    if (c->obuf == NULL || c->reader == NULL) {
        redisFree(c);
        return NULL;
    }

    return c;
}

void redisFree(redisContext *c) {
    if (c == NULL)
        return;

    if (c->funcs && c->funcs->close) {
        c->funcs->close(c);
    }

    sdsfree(c->obuf);
    redisReaderFree(c->reader);
    hi_free(c->tcp.host);
    hi_free(c->tcp.source_addr);
    hi_free(c->unix_sock.path);
    hi_free(c->connect_timeout);
    hi_free(c->command_timeout);
    hi_free(c->saddr);

    if (c->privdata && c->free_privdata)
        c->free_privdata(c->privdata);

    if (c->funcs && c->funcs->free_privctx)
        c->funcs->free_privctx(c->privctx);

    memset(c, 0xff, sizeof(*c));
    hi_free(c);
}

redisFD redisFreeKeepFd(redisContext *c) {
    redisFD fd = c->fd;
    c->fd = REDIS_INVALID_FD;
    redisFree(c);
    return fd;
}

int redisReconnect(redisContext *c) {
    c->err = 0;
    memset(c->errstr, '\0', strlen(c->errstr));

    if (c->privctx && c->funcs->free_privctx) {
        c->funcs->free_privctx(c->privctx);
        c->privctx = NULL;
    }

    if (c->funcs && c->funcs->close) {
        c->funcs->close(c);
    }

    sdsfree(c->obuf);
    redisReaderFree(c->reader);

    c->obuf = sdsempty();
    c->reader = redisReaderCreate();

    if (c->obuf == NULL || c->reader == NULL) {
        __redisSetError(c, REDIS_ERR_OOM, "Out of memory");
        return REDIS_ERR;
    }

    int ret = REDIS_ERR;
    if (c->connection_type == REDIS_CONN_TCP) {
        ret = redisContextConnectBindTcp(c, c->tcp.host, c->tcp.port,
               c->connect_timeout, c->tcp.source_addr);
    } else if (c->connection_type == REDIS_CONN_UNIX) {
        ret = redisContextConnectUnix(c, c->unix_sock.path, c->connect_timeout);
    } else {
        /* Something bad happened here and shouldn't have. There isn't
           enough information in the context to reconnect. */
        __redisSetError(c,REDIS_ERR_OTHER,"Not enough information to reconnect");
        ret = REDIS_ERR;
    }

    if (c->command_timeout != NULL && (c->flags & REDIS_BLOCK) && c->fd != REDIS_INVALID_FD) {
        redisContextSetTimeout(c, *c->command_timeout);
    }

    return ret;
}

redisContext *redisConnectWithOptions(const redisOptions *options) {
    redisContext *c = redisContextInit();
    if (c == NULL) {
        return NULL;
    }
    if (!(options->options & REDIS_OPT_NONBLOCK)) {
        c->flags |= REDIS_BLOCK;
    }
    if (options->options & REDIS_OPT_REUSEADDR) {
        c->flags |= REDIS_REUSEADDR;
    }
    if (options->options & REDIS_OPT_NOAUTOFREE) {
        c->flags |= REDIS_NO_AUTO_FREE;
    }
    if (options->options & REDIS_OPT_NOAUTOFREEREPLIES) {
        c->flags |= REDIS_NO_AUTO_FREE_REPLIES;
    }
    if (options->options & REDIS_OPT_PREFER_IPV4) {
        c->flags |= REDIS_PREFER_IPV4;
    }
    if (options->options & REDIS_OPT_PREFER_IPV6) {
        c->flags |= REDIS_PREFER_IPV6;
    }

    /* Set any user supplied RESP3 PUSH handler or use freeReplyObject
     * as a default unless specifically flagged that we don't want one. */
    if (options->push_cb != NULL)
        redisSetPushCallback(c, options->push_cb);
    else if (!(options->options & REDIS_OPT_NO_PUSH_AUTOFREE))
        redisSetPushCallback(c, redisPushAutoFree);

    c->privdata = options->privdata;
    c->free_privdata = options->free_privdata;

    if (redisContextUpdateConnectTimeout(c, options->connect_timeout) != REDIS_OK ||
        redisContextUpdateCommandTimeout(c, options->command_timeout) != REDIS_OK) {
        __redisSetError(c, REDIS_ERR_OOM, "Out of memory");
        return c;
    }

    if (options->type == REDIS_CONN_TCP) {
        redisContextConnectBindTcp(c, options->endpoint.tcp.ip,
                                   options->endpoint.tcp.port, options->connect_timeout,
                                   options->endpoint.tcp.source_addr);
    } else if (options->type == REDIS_CONN_UNIX) {
        redisContextConnectUnix(c, options->endpoint.unix_socket,
                                options->connect_timeout);
    } else if (options->type == REDIS_CONN_USERFD) {
        c->fd = options->endpoint.fd;
        c->flags |= REDIS_CONNECTED;
    } else {
        redisFree(c);
        return NULL;
    }

    if (c->err == 0 && c->fd != REDIS_INVALID_FD &&
        options->command_timeout != NULL && (c->flags & REDIS_BLOCK))
    {
        redisContextSetTimeout(c, *options->command_timeout);
    }

    return c;
}

/* Connect to a Redis instance. On error the field error in the returned
 * context will be set to the return value of the error function.
 * When no set of reply functions is given, the default set will be used. */
redisContext *redisConnect(const char *ip, int port) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_TCP(&options, ip, port);
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectWithTimeout(const char *ip, int port, const struct timeval tv) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_TCP(&options, ip, port);
    options.connect_timeout = &tv;
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectNonBlock(const char *ip, int port) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_TCP(&options, ip, port);
    options.options |= REDIS_OPT_NONBLOCK;
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectBindNonBlock(const char *ip, int port,
                                       const char *source_addr) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_TCP(&options, ip, port);
    options.endpoint.tcp.source_addr = source_addr;
    options.options |= REDIS_OPT_NONBLOCK;
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectBindNonBlockWithReuse(const char *ip, int port,
                                                const char *source_addr) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_TCP(&options, ip, port);
    options.endpoint.tcp.source_addr = source_addr;
    options.options |= REDIS_OPT_NONBLOCK|REDIS_OPT_REUSEADDR;
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectUnix(const char *path) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_UNIX(&options, path);
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectUnixWithTimeout(const char *path, const struct timeval tv) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_UNIX(&options, path);
    options.connect_timeout = &tv;
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectUnixNonBlock(const char *path) {
    redisOptions options = {0};
    REDIS_OPTIONS_SET_UNIX(&options, path);
    options.options |= REDIS_OPT_NONBLOCK;
    return redisConnectWithOptions(&options);
}

redisContext *redisConnectFd(redisFD fd) {
    redisOptions options = {0};
    options.type = REDIS_CONN_USERFD;
    options.endpoint.fd = fd;
    return redisConnectWithOptions(&options);
}

/* Set read/write timeout on a blocking socket. */
int redisSetTimeout(redisContext *c, const struct timeval tv) {
    if (c->flags & REDIS_BLOCK)
        return redisContextSetTimeout(c,tv);
    return REDIS_ERR;
}

int redisEnableKeepAliveWithInterval(redisContext *c, int interval) {
    return redisKeepAlive(c, interval);
}

/* Enable connection KeepAlive. */
int redisEnableKeepAlive(redisContext *c) {
    return redisKeepAlive(c, REDIS_KEEPALIVE_INTERVAL);
}

/* Set the socket option TCP_USER_TIMEOUT. */
int redisSetTcpUserTimeout(redisContext *c, unsigned int timeout) {
    return redisContextSetTcpUserTimeout(c, timeout);
}

/* Set a user provided RESP3 PUSH handler and return any old one set. */
redisPushFn *redisSetPushCallback(redisContext *c, redisPushFn *fn) {
    redisPushFn *old = c->push_cb;
    c->push_cb = fn;
    return old;
}

/* Use this function to handle a read event on the descriptor. It will try
 * and read some bytes from the socket and feed them to the reply parser.
 *
 * After this function is called, you may use redisGetReplyFromReader to
 * see if there is a reply available. */
int redisBufferRead(redisContext *c) {
    char buf[1024*16];
    int nread;

    /* Return early when the context has seen an error. */
    if (c->err)
        return REDIS_ERR;

    nread = c->funcs->read(c, buf, sizeof(buf));
    if (nread < 0) {
        return REDIS_ERR;
    }
    if (nread > 0 && redisReaderFeed(c->reader, buf, nread) != REDIS_OK) {
        __redisSetError(c, c->reader->err, c->reader->errstr);
        return REDIS_ERR;
    }
    return REDIS_OK;
}

/* Write the output buffer to the socket.
 *
 * Returns REDIS_OK when the buffer is empty, or (a part of) the buffer was
 * successfully written to the socket. When the buffer is empty after the
 * write operation, "done" is set to 1 (if given).
 *
 * Returns REDIS_ERR if an unrecoverable error occurred in the underlying
 * c->funcs->write function.
 */
int redisBufferWrite(redisContext *c, int *done) {

    /* Return early when the context has seen an error. */
    if (c->err)
        return REDIS_ERR;

    if (sdslen(c->obuf) > 0) {
        ssize_t nwritten = c->funcs->write(c);
        if (nwritten < 0) {
            return REDIS_ERR;
        } else if (nwritten > 0) {
            if (nwritten == (ssize_t)sdslen(c->obuf)) {
                sdsfree(c->obuf);
                c->obuf = sdsempty();
                if (c->obuf == NULL)
                    goto oom;
            } else {
                if (sdsrange(c->obuf,nwritten,-1) < 0) goto oom;
            }
        }
    }
    if (done != NULL) *done = (sdslen(c->obuf) == 0);
    return REDIS_OK;

oom:
    __redisSetError(c, REDIS_ERR_OOM, "Out of memory");
    return REDIS_ERR;
}

/* Internal helper that returns 1 if the reply was a RESP3 PUSH
 * message and we handled it with a user-provided callback. */
static int redisHandledPushReply(redisContext *c, void *reply) {
    if (reply && c->push_cb && redisIsPushReply(reply)) {
        c->push_cb(c->privdata, reply);
        return 1;
    }

    return 0;
}

/* Get a reply from our reader or set an error in the context. */
int redisGetReplyFromReader(redisContext *c, void **reply) {
    if (redisReaderGetReply(c->reader, reply) == REDIS_ERR) {
        __redisSetError(c,c->reader->err,c->reader->errstr);
        return REDIS_ERR;
    }

    return REDIS_OK;
}

/* Internal helper to get the next reply from our reader while handling
 * any PUSH messages we encounter along the way.  This is separate from
 * redisGetReplyFromReader so as to not change its behavior. */
static int redisNextInBandReplyFromReader(redisContext *c, void **reply) {
    do {
        if (redisGetReplyFromReader(c, reply) == REDIS_ERR)
            return REDIS_ERR;
    } while (redisHandledPushReply(c, *reply));

    return REDIS_OK;
}

int redisGetReply(redisContext *c, void **reply) {
    int wdone = 0;
    void *aux = NULL;

    /* Try to read pending replies */
    if (redisNextInBandReplyFromReader(c,&aux) == REDIS_ERR)
        return REDIS_ERR;

    /* For the blocking context, flush output buffer and read reply */
    if (aux == NULL && c->flags & REDIS_BLOCK) {
        /* Write until done */
        do {
            if (redisBufferWrite(c,&wdone) == REDIS_ERR)
                return REDIS_ERR;
        } while (!wdone);

        /* Read until there is a reply */
        do {
            if (redisBufferRead(c) == REDIS_ERR)
                return REDIS_ERR;

            if (redisNextInBandReplyFromReader(c,&aux) == REDIS_ERR)
                return REDIS_ERR;
        } while (aux == NULL);
    }

    /* Set reply or free it if we were passed NULL */
    if (reply != NULL) {
        *reply = aux;
    } else {
        freeReplyObject(aux);
    }

    return REDIS_OK;
}


/* Helper function for the redisAppendCommand* family of functions.
 *
 * Write a formatted command to the output buffer. When this family
 * is used, you need to call redisGetReply yourself to retrieve
 * the reply (or replies in pub/sub).
 */
int __redisAppendCommand(redisContext *c, const char *cmd, size_t len) {
    sds newbuf;

    newbuf = sdscatlen(c->obuf,cmd,len);
    if (newbuf == NULL) {
        __redisSetError(c,REDIS_ERR_OOM,"Out of memory");
        return REDIS_ERR;
    }

    c->obuf = newbuf;
    return REDIS_OK;
}

int redisAppendFormattedCommand(redisContext *c, const char *cmd, size_t len) {

    if (__redisAppendCommand(c, cmd, len) != REDIS_OK) {
        return REDIS_ERR;
    }

    return REDIS_OK;
}



int redisvAppendCommand(redisContext *c, const char *format, va_list ap) {
    char *cmd;
    int len;

    len = redisvFormatCommand(&cmd,format,ap);
    if (len == -1) {
        __redisSetError(c,REDIS_ERR_OOM,"Out of memory");
        return REDIS_ERR;
    } else if (len == -2) {
        __redisSetError(c,REDIS_ERR_OTHER,"Invalid format string");
        return REDIS_ERR;
    }

    if (__redisAppendCommand(c,cmd,len) != REDIS_OK) {
        hi_free(cmd);
        return REDIS_ERR;
    }

    hi_free(cmd);
    return REDIS_OK;
}

int redisAppendCommand(redisContext *c, const char *format, ...) {
    va_list ap;
    int ret;

    va_start(ap,format);
    ret = redisvAppendCommand(c,format,ap);
    va_end(ap);
    return ret;
}

int redisAppendCommandArgv(redisContext *c, int argc, const char **argv, const size_t *argvlen) {
    sds cmd;
    long long len;

    len = redisFormatSdsCommandArgv(&cmd,argc,argv,argvlen);
    if (len == -1) {
        __redisSetError(c,REDIS_ERR_OOM,"Out of memory");
        return REDIS_ERR;
    }

    if (__redisAppendCommand(c,cmd,len) != REDIS_OK) {
        sdsfree(cmd);
        return REDIS_ERR;
    }

    sdsfree(cmd);
    return REDIS_OK;
}

/* Helper function for the redisCommand* family of functions.
 *
 * Write a formatted command to the output buffer. If the given context is
 * blocking, immediately read the reply into the "reply" pointer. When the
 * context is non-blocking, the "reply" pointer will not be used and the
 * command is simply appended to the write buffer.
 *
 * Returns the reply when a reply was successfully retrieved. Returns NULL
 * otherwise. When NULL is returned in a blocking context, the error field
 * in the context will be set.
 */
static void *__redisBlockForReply(redisContext *c) {
    void *reply;

    if (c->flags & REDIS_BLOCK) {
        if (redisGetReply(c,&reply) != REDIS_OK)
            return NULL;
        return reply;
    }
    return NULL;
}

void *redisvCommand(redisContext *c, const char *format, va_list ap) {
    if (redisvAppendCommand(c,format,ap) != REDIS_OK)
        return NULL;
    return __redisBlockForReply(c);
}

void *redisCommand(redisContext *c, const char *format, ...) {
    va_list ap;
    va_start(ap,format);
    void *reply = redisvCommand(c,format,ap);
    va_end(ap);
    return reply;
}

void *redisCommandArgv(redisContext *c, int argc, const char **argv, const size_t *argvlen) {
    if (redisAppendCommandArgv(c,argc,argv,argvlen) != REDIS_OK)
        return NULL;
    return __redisBlockForReply(c);
}
