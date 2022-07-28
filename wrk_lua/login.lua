
request = function()
    local rand_idx = math.random(1, 10000000)
    local name = "test"..tostring(rand_idx)
    local method = "POST"
    local path = "/login"
    local body = string.format('name=%s&password=d00abfd3950903dd746199b3bd58516e', name)
    print("body:"..body)
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
