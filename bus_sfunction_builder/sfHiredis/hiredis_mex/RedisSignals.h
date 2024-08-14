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
#define REDIS_INVALID_FD -1


#else
#ifdef _WIN64
typedef unsigned long long redisFD; /* SOCKET = 64-bit UINT_PTR */
#else
typedef unsigned long redisFD;      /* SOCKET = 32-bit UINT_PTR */
#endif
#define REDIS_INVALID_FD ((redisFD)(~0)) /* INVALID_SOCKET */
#endif
