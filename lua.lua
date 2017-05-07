NE = {a=1,b=2}
_NE = {c=32}
setmetatable(NE, {__newindex=function(table, key, value) end, __index=_NE})
print(NE.a)
NE.c = 3
print(_NE.c)
print(NE.c)
print(NE.d)

print('------')
d1 = { a=1 }
d2 = d1
print(d1.a)
print(d2.a)
d2.a = 3 
print(d1.a)
print(d2.a)
