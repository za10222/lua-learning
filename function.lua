
function Sum(...)
    local s=0
    for key, value in ipairs{...} do
        s=s+value
    end
    return s
    end

    
function Test(...)
    for i = 1, select("#",...), 1 do
        local w=select(i,...)
        print((select(i,...)))
        print(w)
    end
end


print(Sum(1,2,3,4))
Test(3,4,2,1)

