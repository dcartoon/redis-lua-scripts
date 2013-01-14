redis-lua-scripts
=================

Collection of Lua scripts for use with Redis.  There are simple BASH scripts
for testing functionality.

BASH script approach borrowed from: http://sunilarora.org/redis-lua-scripting

zmovebyrange
============

Move a range(by score) of items from one sorted set to another sorted set.

zmovebyrank
============

Move a range(by rank) of items from one sorted set to another sorted set.

zmultstore
============

Multiply the item scores from one sorted set with item scores from another
 sorted set.  Results are stored in a third set.

zdivstore
============

Divide the item scores from one sorted set by item scores from another sorted
 set.  Results are stored in a third set.
