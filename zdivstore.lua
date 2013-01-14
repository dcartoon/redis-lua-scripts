local numSetId = KEYS[1]
local denSetId = KEYS[2]
local destSetId = KEYS[3]

local data = redis.call('zrange', numSetId, 0, -1, 'WITHSCORES')
for k, v in pairs(data) do 
    -- values and scores are returned as alternating items in data
    -- where values are at odd indexes and scores are at even indexes
    if k % 2 == 1 then 
        local val  = v
        local numScore = tonumber(data[k + 1])
        local denScore = tonumber(redis.call('zscore', denSetId, val))

        if denScore and denScore ~= 0 then
            redis.call('zadd', destSetId, numScore / denScore, val)
        end
    end
end
return 'ok'
