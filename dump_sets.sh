REDIS_CLI=redis-cli
SET_1=set1
SET_2=set2

echo "Set 1 values"
${REDIS_CLI} zrange ${SET_1} 0 -1 WITHSCORES

echo "Set 2 values"
${REDIS_CLI} zrange ${SET_2} 0 -1 WITHSCORES
