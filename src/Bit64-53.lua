local select = select

local bit64 = {rshift = function(x, disp)
    return x >> disp
end, arshift = function(x, disp)
    if disp <= 0 or x >= 0 then
        return x >> disp
    end
    return (x >> disp) | (~0 << (64 - disp))
end, lshift = function(x, disp)
    return x << disp
end, band = function(...)
    local n = select("#", ...)
    if n == 0 then
        return -1
    elseif n == 1 then
        return ... | 0
    elseif n == 2 then
        local a, b = ...; return a & b
    end

    local vals = {...}
    local v = vals[1]
    local i = 2
    while i <= n do
        v = v & vals[i]
        i = i + 1
    end

    return v
end, bor = function(...)
    local n = select("#", ...)
    if n == 0 then
        return 0
    elseif n == 1 then
        return ... | 0
    elseif n == 2 then
        local a, b = ...; return a | b
    end

    local vals = {...}
    local v = vals[1]
    local i = 2
    while i <= n do
        v = v | vals[i]
        i = i + 1
    end

    return v
end, bnot = function(x)
    return ~x
end, btest = function(...)
    local n = select("#", ...)
    if n == 0 then
        return true
    elseif n == 1 then
        if ... | 0 ~= 0 then
            return false
        else
            return true
        end
    elseif n == 2 then
        local a, b = ...; return (a & b) ~= 0
    end

    local vals = {...}
    local v = vals[1]
    local i = 2
    while i <= n do
        v = v & vals[i]
        if v == 0 then
            return false
        end
        i = i + 1
    end

    return true
end, bxor = function(...)
    local n = select("#", ...)
    if n == 0 then
        return 0
    elseif n == 1 then
        return 0 ~ ...
    elseif n == 2 then
        local a, b = ...; return a ~ b
    end

    local vals = {...}
    local v = vals[1]
    local i = 2
    while i <= n do
        v = v ~ vals[i]
        i = i + 1
    end

    return v
end, rrotate = function(x, disp)
    return x >> disp | (x & (~0 >> (64 - disp))) << (64 - disp)
end, lrotate = function(x, disp)
    return x << disp | (x & (~0 << (64 - disp))) >> (64 - disp)
end, extract = function(n, field, width)
    local n = n
    local field = field
    local width = width or 1
    if field < 0 or width < 1 or field + width > 64 then
        error("trying to access non-existent bits", 2)
    end

    local mask = ~(-1 << width)
    return (n >> field) & mask
end, replace = function(n, v, field, width)
    local n = n
    local v = v
    local field = field
    local width = width or 1
    if field < 0 or width < 1 or field + width > 64 then
        error("trying to access non-existent bits", 2)
    end

    local mask = ~(-1 << width)
    return (n & ~(mask << field)) | ((v & mask) << field)
end}

return bit64
