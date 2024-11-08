# localStorage

A recreation of the browser interface localStorage  
Essentially a simple interface for persistent storage in love2d context  

## Getting started

The library needs json.lua to function so it's distributed with [pluto](https://github.com/qeffects/pluto-cli)  
If your project already uses pluto we can proceed, otherwise follow the instructions linked above  
  
Add this package to your project:  
`pluto add -n localStorage`  
  
Then run  
`pluto install`  
  
After everything has completed you can start using localStorage like so:

```lua
require("pluto")
local ls = require("localStorage")

ls.set("field", "value")
print(ls.get("field"))
```

And that's about it, use `.set(fieldName, value)` to set a value (can be number, string, table, etc.)  
The value will get automatically saved to the filesystem and available on the next reload
And `.get(fieldName)` to get the persistent value  
  
There's a few more functions for advanced usage:  
  
## localStorage.set(fieldName, value)
  
Sets a field to a value and saves if autoSave is enabled (it is by default)  

[fieldName]: string  
The name the field should be named  

[value]: any  
The value to set the field to, it can be basic tables (no recursion),  
or lua primitives like boolean, string, number etc.  

## localStorage.get(fieldName, default)

Gets a value from the field "fieldName", or returns the default value (if provided)

[fieldName]: string
The name of the field to return

[default]: any
A default value, returned in case the field is not populated

## localStorage.init(autosave, filename)  

Manually initates (loads the file) of the library  
and also allows for some (optional) configuration with the parameters  

[autosave]: boolean  
Whether to enable autosaving of the storage data to the disk  
(turn this off if you want to save it manually, e.g. in love.quit)  

[filename]: string  
Use this to override the default filename  

## localStorage.save()

Call this to save the current state to disk (see init for how to configure and when to use)


This library uses json.lua so you can also `require("json-lua")` and use it yourself (if needed)
