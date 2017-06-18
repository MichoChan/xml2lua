#!/usr/bin/env lua

---Sample application to read a XML file and print it on the terminal.
--@author Manoel Campos da Silva Filho - http://manoelcampos.com

require("luaxml")
--Uses a handler that converts the XML to a Lua table
local handler = require("xmlhandler/tree")

local xml = luaxml.loadFile("people.xml")

--Instantiates the XML parser
local parser = luaxml.parser(handler)
parser:parse(xml)

--Manually prints the table (since the XML structure for this example is previously known)
for k, p in pairs(handler.root.people.person) do
  print("Name:", p.name, "City:", p.city, "Type:", p._attr.type)
end

--Recursivelly prints the table in an easy-to-ready format
--luaxml.printable(handler.root)

--Recursivelly prints the table in a more structured way
--print(luaxml.showTable(handler.root))