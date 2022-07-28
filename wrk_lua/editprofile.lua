function guid()
    local seed={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
    local tb={}
    for i=1,32 do
        table.insert(tb,seed[math.random(1,36)])
    end
    local sid=table.concat(tb)
    return string.format('%s-%s-%s-%s-%s',
        string.sub(sid,1,8),
        string.sub(sid,9,12),
        string.sub(sid,13,16),
        string.sub(sid,17,20),
        string.sub(sid,21,32)
    )
end

request = function()
    --local nickname = guid()
    local rand_idx = math.random(1, 10000000)
    local name = "test"..tostring(rand_idx)
    local token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImZjZGIwNmE3MmFmMDUxNjUwMmU1ZmRjY2M5MTgxZWUwIiwicGFzc3dvcmQiOiJlMTBhZGMzOTQ5YmE1OWFiYmU1NmUwNTdmMjBmODgzZSIsImV4cCI6MTY1NTI5MDA4NywiaXNzIjoiZ2luLWJsb2cifQ.p0RKjYzaTSrli1OoccTM2Uc_EZzGrGpRFPXALwySDmM"
    local method = "POST"
    local path = string.format('/api/v1/profile?name=%s&token=%s&nickname=%s', name, token, name)
    print("path:"..path)
    local headers = {}
    headers["Content-Type"] = "application/x-www-form-urlencoded"
    return wrk.format(method, path, headers, body)
end

response = function(status, headers, body)
    if status ~= 200 then
        print("Faild, http status: " .. tostring(status))
    else
        print(body)
    end
end
