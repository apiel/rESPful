function cmd(commands)
    local output = ""
    node.output(function(data)
        output = output .. data
    end, 0)
    pcall(loadstring(commands))
    node.output(nil)

    return output
end
