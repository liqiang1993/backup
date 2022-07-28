
request = function()
    local rand_idx = math.random(1, 10000000)
    local name = "test"..tostring(rand_idx)
    local token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImZjZGIwNmE3MmFmMDUxNjUwMmU1ZmRjY2M5MTgxZWUwIiwicGFzc3dvcmQiOiJlMTBhZGMzOTQ5YmE1OWFiYmU1NmUwNTdmMjBmODgzZSIsImV4cCI6MTY1NTI3NjA2OCwiaXNzIjoiZ2luLWJsb2cifQ.jusliePXuC_xFO0ivU84GjanSfpyQG6DzntR8vu9apY" 
    local method = "GET"
    local path = string.format('/api/v1/profile?name=%s&token=%s', name, token)
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
