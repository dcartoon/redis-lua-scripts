local fromSetId = KEYS[1]
local toSetId = KEYS[2]
local min = ARGV[1]
local max = ARGV[2]
local score = ARGV[3]

local data = redis.call('zrange', fromSetId, min, max, 'WITHSCORES')
for k, v in pairs(data) do 
    if k % 2 == 1 then 
        local val  = v
        local score = data[k + 1]
        redis.call('zadd', toSetId, score, v)
    end
end
redis.call('zremrangebyrank', fromSetId, min, max)

return 'ok'
