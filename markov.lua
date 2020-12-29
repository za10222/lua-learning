function prefix(w1,w2)
    return w1 .. " " .. w2 
    
end
statelab ={}
function insert(index ,value)
    local list= statelab[index]
    if list==nil then
        statelab[index]={value}
    else
        list[#list+1]=value
    end
end

function allwords()
    local line=io.read()
    local pos=1
    return function ()
        while line do
            local s,e=string.find(line,"%w+",pos)
            if s then
                pos=e+1
                return string.sub(line,s,e)
            else
                line=io.read()
                pos=1
            end
        end
        return nil
    end
    
end

local N=2
local MAXGEN=10000
local NOWORD="\n"
local w1,w2=NOWORD,NOWORD
for w in allwords() do
    insert(prefix(w1,w2),w)
    w1=w2
    w2=w
end
insert(prefix(w1,w2),NOWORD)

io.write("out:","\n")
w1=NOWORD;
w2=NOWORD;
for i = 1, MAXGEN do
    local list=statelab[prefix(w1,w2)]
    local r=math.random(#list)
    local nextword= list[r]
    if nextword == NOWORD then 
        return 
    end
    io.write(nextword," ")
    w1=w2;
    w2=nextword;
end