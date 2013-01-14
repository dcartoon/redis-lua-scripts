REDIS_CLI=redis-cli
MIN=$2
MAX=$3

if [ -z "$MIN" ]
then
   MIN=1
fi

if [ -z "$MAX" ]
then
   MAX=5
fi
   
# Remove any left-over data, send output to /dev/null so it doesn't clutter
# output
${REDIS_CLI} del $1 > /dev/null

for i in $(seq $MIN $MAX)
do
    ${REDIS_CLI} zadd $1 $i "value${i}" > /dev/null
done

echo "Initial data in $1"
${REDIS_CLI} zrange $1 0 -1 WITHSCORES
