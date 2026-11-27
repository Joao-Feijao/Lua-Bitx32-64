local select = select
local MASK32 <const> = 0xFFFFFFFF

local bit32 = {
    rshift = function(x, disp)
        return ((x & MASK32) >> disp) & MASK32
    end,
    arshift = function(x, disp)
        x = x & MASK32
        if disp <= 0 or (x & 0x80000000) == 0 then
            return (x >> disp) & MASK32
        end
        return ((x >> disp) | (MASK32 << (32 - disp))) & MASK32
    end,
    lshift = function(x, disp)
        return (x << disp) & MASK32
    end,
    band = function(...)
        local n <const> = select("#", ...)
        if n == 0 then
            return MASK32
        elseif n == 1 then
            return ... & MASK32
        elseif n == 2 then
            local a, b = ...
            return a & b & MASK32
        end

        local vals = {...}
        local v = vals[1]
        for i = 2, n do
            v = v & vals[i]
        end
        return v & MASK32
    end,
    bor = function(...)
        local n <const> = select("#", ...)
        if n == 0 then
            return 0
        elseif n == 1 then
            return ... & MASK32
        elseif n == 2 then
            local a, b = ...
            return (a | b) & MASK32
        end

        local vals = {...}
        local v = vals[1]
        for i = 2, n do
            v = v | vals[i]
        end
        return v & MASK32
    end,
    bnot = function(x)
        return (~x) & MASK32
    end,
    btest = function(...)
        local n <const> = select("#", ...)
        if n == 0 then
            return true
        elseif n == 1 then
            return (... & MASK32) ~= 0
        elseif n == 2 then
            local a, b = ...
            return (a & b & MASK32) ~= 0
        end

        local vals = {...}
        local v = vals[1] & MASK32
        for i = 2, n do
            v = v & vals[i]
            if v == 0 then return false end
        end
        return v ~= 0
    end,
    bxor = function(...)
        local n <const> = select("#", ...)
        if n == 0 then
            return 0
        elseif n == 1 then
            return ... & MASK32
        elseif n == 2 then
            local a, b = ...
            return (a ~ b) & MASK32
        end

        local vals = {...}
        local v = vals[1]
        for i = 2, n do
            v = v ~ vals[i]
        end
        return v & MASK32
    end,
    rrotate = function(x, disp)
        x = x & MASK32
        disp = disp & 31
        if disp == 0 then return x end
        return ((x >> disp) | (x << (32 - disp))) & MASK32
    end,
    lrotate = function(x, disp)
        x = x & MASK32
        disp = disp & 31
        if disp == 0 then return x end
        return ((x << disp) | (x >> (32 - disp))) & MASK32
    end,
    extract = function(n, field, width)
        width = width or 1
        if field < 0 or width < 1 or field + width > 32 then
            error("trying to access non-existent bits", 2)
        end
        local mask <const> = ~(-1 << width)
        return (n >> field) & mask
    end,
    replace = function(n, v, field, width)
        width = width or 1
        if field < 0 or width < 1 or field + width > 32 then
            error("trying to access non-existent bits", 2)
        end
        local mask <const> = ~(-1 << width)
        return ((n & ~(mask << field)) | ((v & mask) << field)) & MASK32
    end
}

return bit32
