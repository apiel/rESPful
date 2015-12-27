function httpd_urldecode(s)
    s = s:gsub('+', ' '):gsub('%%(%x%x)',
        function(h)
            return string.char(tonumber(h, 16))
        end)
    return s
end

function httpd_init()
    if srv then
        srv:close()
    end
    srv=net.createServer(net.TCP) 
    srv:listen(80,function(conn) 
        conn:on("receive",function(conn,payload) 
            --print(payload)
            local commands = string.match(payload,"commands=([%.%w%%+]+)") 
            if commands then
                commands = httpd_urldecode(commands)
                print("http command: " .. commands)
                local output = cmd(commands)
                print(output)
                conn:send(output .. "\n")
            else
                conn:send("No command")
            end
            conn:close()
            collectgarbage()
        end) 
    end)
end
