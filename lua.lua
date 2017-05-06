NE = {a=1,b=2}
_NE = {c=32}
setmetatable(NE, {__newindex=function(table, key, value) end, __index=_NE})
print(NE.a)
NE.c = 3
print(_NE.c)
print(NE.c)
print(NE.d)


data = {}
data:extend({})
