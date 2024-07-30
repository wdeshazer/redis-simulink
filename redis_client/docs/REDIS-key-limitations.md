https://redis.io/docs/latest/develop/get-started/faq/


##  What is the maximum number of keys a single Redis instance can hold? What is the maximum number of elements in a Hash, List, Set, and Sorted Set?

Redis can handle up to `2^32` keys, and was tested in practice to handle at least `250 million keys per instance`.

Every hash, list, set, and sorted set, can hold `2^32 elements`.

<u>In other words your limit is likely the available memory in your system.</u>

# String limitations

512 MiB is the limitations for a string/key. or `2^28` or 268,435,456 characters. Therefore