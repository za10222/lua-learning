list={1,2,3}
link=nil
for key, value in pairs(list) do
    link ={next=link,value=value}
end
l=link
while l do
print(l.value)
l=l.next
end

table.insert()