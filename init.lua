require("pluto")
local json = require("json-lua")

local inited = false

local localStorage = {
    data = {},
    filename = "localStorage.json",
    autoSave = true
}

function localStorage.init(autoSave, filename)
    localStorage.filename = filename or localStorage.filename
    local fn = localStorage.filename
    localStorage.autoSave = autoSave or true
    local isFile = love.filesystem.getInfo(fn)

    if (isFile) then
        local file = love.filesystem.read("string", fn)

        localStorage.data = json.decode(file)
    end
    
    inited = true
end

function localStorage.get(fieldName, default)
    if not inited then
        localStorage.init()
    end

    return localStorage.data[fieldName] or default
end

function localStorage.set(fieldName, value)
    if not inited then
        localStorage.init()
    end

    localStorage.data[fieldName] = value

    if localStorage.autoSave then
        localStorage.save()
    end
end

function localStorage.save()
    local s = json.encode(localStorage.data)
    love.filesystem.write(localStorage.filename, s)
end

return localStorage