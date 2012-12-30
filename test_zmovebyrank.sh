REDIS_CLI=redis-cli
SET_1=set1
SET_2=set2

./populate_set.sh

# Remove any left-over data
${REDIS_CLI} eval "$(cat zmovebyrank.lua)" 2 ${SET_1} ${SET_2} 0 1 

./dump_sets.sh
