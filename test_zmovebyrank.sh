REDIS_CLI=redis-cli
SET_1=set1
SET_2=set2

./populate_set.sh $SET_1
${REDIS_CLI} del $SET_2 > /dev/null

# Remove any left-over data
${REDIS_CLI} eval "$(cat zmovebyrank.lua)" 2 ${SET_1} ${SET_2} 0 1 

./dump_set.sh $SET_1
./dump_set.sh $SET_2
