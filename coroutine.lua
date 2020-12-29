-- co=coroutine.create(function ()
--     for i=1,10 do
--         print("co",i)
--         coroutine.yield()
--     end
-- end)
-- coroutine.resume(co)
-- coroutine.resume(co)
-- coroutine.resume(co)

productor =coroutine.create(
    function ()
        while true do
            local x=io.read()
            send(x)
        end
    end
)

function receive()
    local status,value =coroutine.resume(productor)
    return value
    
end
function send(x)
    coroutine.yield(x)
end
-- local x =receive()

function per(a,n)
    n=n or #a
    if(n<=1)then
        coroutine.yield(a)
    else
        for i = 1, n do
            a[n],a[i]=a[i],a[n]
            per(a,n-1)
            a[n],a[i]=a[i],a[n]
        end
    end
    
end

function printResult(a)
    for i = 1, #a do
        io.write(a[i]," ")
    end
    io.write("\n")
end
function permu(a)
    local co=coroutine.create(function ()
        per(a)
    end)
    return function ()
        local code,res=coroutine.resume(co)
        return res
    end
end

for p in permu({"a","b","c","d"})  do
    printResult(p)
end