REDIS_CLI=redis-cli
SET_1=set1
SET_2=set2

# Remove any left-over data, send output to /dev/null so it doesn't clutter
# output
${REDIS_CLI} del ${SET_1} > /dev/null
${REDIS_CLI} del ${SET_2} > /dev/null

${REDIS_CLI} zadd ${SET_1} 1 "value1" > /dev/null
${REDIS_CLI} zadd ${SET_1} 2 "value2" > /dev/null
${REDIS_CLI} zadd ${SET_1} 3 "value3" > /dev/null
${REDIS_CLI} zadd ${SET_1} 4 "value4" > /dev/null

echo "Initial data in ${SET_1}"
 ${REDIS_CLI} zrange ${SET_1} 0 -1 WITHSCORES
