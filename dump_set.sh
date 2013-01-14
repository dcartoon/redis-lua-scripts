REDIS_CLI=redis-cli

echo "$1 values"
${REDIS_CLI} zrange $1 0 -1 WITHSCORES
