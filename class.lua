local function class(className, super)
    -- 构建类
    local clazz = { __cname = className, super = super , ctor = function() end}
    if super then
        -- 设置类的元表，此类中没有的，可以查找父类是否含有
        setmetatable(clazz, { __index = super })
    end
    -- new 方法创建类对象
    clazz.new = function(...)
        -- 构造一个对象
        local instance = {}
        -- 设置对象的元表为当前类，这样，对象就可以调用当前类生命的方法了
        setmetatable(instance, { __index = clazz })
        -- ctor为构造函数
        clazz.ctor(instance, ...)
        return instance
    end
    return clazz
end

--Queue
local Queue=class("Queue")
function Queue:ctor()
    self._head=1;
    self._end=0;
    self._size=0;
    self._array={};
end

function Queue:pop()
    if (self._size == 0)
    then
        error("pop when no elements in queue")
    end
    self._array[self._head]=nil;
    self._head=self._head+1;
    self._size=self._size-1;
end

function Queue:push(value)
    self._end=self._end+1;
    self._size=self._size+1;
    self._array[self._end]=value;
end

function Queue:front()
    if (self._size == 0)
    then
        error(" no elements in queue")
    end
    local result=self._array[self._head];
    return result;
end

function Queue:size()
    return self._size;
end

--Stack
local Stack=class("Stack")
function Stack:ctor()
    self._size=0;
    self._queuestack=Queue.new();
    self._queuesub=Queue.new();
end

function Stack:pop()
    if (self._size == 0)
    then
        error("pop when no elements in stack")
    end

    self._queuestack:pop();
    self._size=self._size-1;
end

function Stack:push(value)
    self._size=self._size+1;
    self._queuesub:push(value);
    while self._queuestack:size()>0 do
        self._queuesub:push( self._queuestack:front());
        self._queuestack:pop();
    end
    local temp=self._queuesub;
    self._queuesub=self._queuestack;
    self._queuestack=temp;
end
function Stack:top()
    if (self._size == 0)
    then
        error(" no elements in stack")
    end

    local result=self._queuestack:front();
    return result;
end

function Stack:size()
    return self._size;
end

local function queuetest()
    local queue_a=Queue.new();
    queue_a:push("1");
    queue_a:push("2");
    queue_a:push("3");
    queue_a:push("4");


    local queue_b=Queue.new();
    queue_b:push("4");
    queue_b:push("3");
    queue_b:push("2");
    queue_b:push("1");

    print("queue_a :");
    while queue_a:size()>0 do
        print(queue_a:front());
        queue_a:pop();
    end

    queue_a:push("4");
    queue_a:push("3");
    queue_a:push("2");
    queue_a:push("1");

    print("queue_a :");
    while queue_a:size()>0 do
        print(queue_a:front());
        queue_a:pop();
    end
    print("queue_b :");

    while queue_b:size()>0 do
        print(queue_b:front());
        queue_b:pop();
    end
end
local function stacktest()
    local stack=Stack.new();
    stack:push("1");
    stack:push("2");
    stack:push("3");
    stack:push("4");


  
    print("stack :");
    while stack:size()>0 do
        print(stack:top());
        stack:pop();
    end
end
stacktest()