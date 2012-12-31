local fromSetId = KEYS[1]
local toSetId = KEYS[2]
local min = ARGV[1]
local max = ARGV[2]

local data = redis.call('zrangebyscore', fromSetId, min, max, 'WITHSCORES')
for k, v in pairs(data) do
    -- values and scores are returned as alternating items in data
    -- where values are at odd indexes and scores are at even indexes
    if k % 2 == 1 then
        local val = v
        local score = data[k + 1]
        redis.call('zadd', toSetId, score, v)
    end
end
redis.call('zremrangebyscore', fromSetId, min, max)

return 'ok'
