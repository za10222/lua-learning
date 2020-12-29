a={1,2,3}
local function iter(a,i)
    i=i+1
    local v=a[i]
    if v then
        return i,v 
    end
end

function  ipairs(a)
    return iter,a,0
end
for i,v in ipairs(a) do
    print(1,v)
end

-- function allwords(f)
--     for line in io.lines do
--         for word in string.gmatch(line,"%a+") do
--             f(word)
--         end
--     end
-- end
-- allwords(print)