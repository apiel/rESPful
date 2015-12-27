function http_send_request(domain, ip, port, uri, callback)
    local conn=net.createConnection(net.TCP, false) 
    conn:on("receive", callback)
    conn:connect(port, ip)
    conn:send("GET " .. uri .. " HTTP/1.1\r\nHost: " .. domain .. "\r\n"
        .."Connection: keep-alive\r\nAccept: */*\r\n\r\n")
end