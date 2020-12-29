print(type(io))

Set={}
local mt={}

function Set.union(a,b)
    local res   ={}
    for v in pairs(a) do
        res[v]=true
    end
    for v in pairs(b) do
        res[v]=true
    end
    return res
    end

function Set.new(l)
local set   ={}
setmetatable(set,mt)
for _,v in ipairs(l) do
    set[v]=true
    
end
return set
end
mt.__add=Set.union

s1=Set.new({1,2,3})
s2=Set.new({2,3,5})
c=s1+s2