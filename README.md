# rESPful

rESPful is an api to interact with your nodeMCU device using http request. It connect automatically to your wifi network and run a web server. You can then send request to the web server to execute commands. If the connection to the WIFI failed, it setup a WIFI access point.

To setup you WIFI config you have to create a file wifi_cfg.lua

```
wifi.sta.config("your_ssid","your_password")
```

In order to create this file you can run the following command

```
file.open("wifi_cfg.lua", "w+")
file.writeline("wifi.sta.config(\"ssid\",\"password\")")
file.close()
```

To send commands to the nodeMCU web server

```
http://nodemcu_ip/?commands=your_commands
```

Or you can use POST request, see form.html as example

There is as well an IDE to edit file directly on the nodeMCU with the restful api.

One more feature allow you to get a list of commands from a remote server, to execute when the WIFI connection succeed, see:

```
wifi_init(function()
    http_send_request("localhost", "127.0.0.1", 80, "/commands.html", function(conn, data) 
        local commands = string.sub(data,string.find(data, "\n\r\n"),-1)
        print(cmd(commands))
    end)
end)
```

Replace domain, ip, ... 