REDIS_CLI=redis-cli
SET_1=set1
SET_2=set2
SET_DEST=setDest

./populate_set.sh $SET_1 
./populate_set.sh $SET_2

# Testing is more valuable if the input sets contain different scores
for i in $(seq 1 5)
do
    SCORE=$[i * i]
    ${REDIS_CLI} zadd $SET_2 $SCORE "value${i}" > /dev/null
done

${REDIS_CLI} del $SET_DEST > /dev/null

# Remove any left-over data
${REDIS_CLI} eval "$(cat zdivstore.lua)" 3 ${SET_1} ${SET_2} ${SET_DEST}

./dump_set.sh $SET_2
./dump_set.sh $SET_DEST
