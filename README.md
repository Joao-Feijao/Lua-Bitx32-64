# [Lua-Bitx32-64](https://luarocks.org/modules/joao-feijao/bitx32-64)
LuaRocks description: <br>
*Gives Lua 5.2 bit32 module support for Lua 5.4 and Lua 5.5 (and even Lua 5.3) with a builtin integration made up entirely using Lua.*<br>
*Also features a bit64 extra module for other applications.*<br>

You can install it with LuaRocks using:
```bash
$ luarocks install Bitx32-64
```
And you can require it using:
```lua
require("Bit32-53") -- For bit32 in Lua 5.3
require("Bit64-53") -- For bit64 in Lua 5.3
require("Bit32-54") -- For bit32 in Lua 5.4 or Lua 5.5
require("Bit64-54") -- For bit64 in Lua 5.4 or Lua 5.5
```

<details>
<summary>🔤 <b>bit32 functions</b></summary>

<b>bit32</b>.rshift(x, disp)<br>
Description: Equivalent to `x >> disp` (logical right shift, fills with zeros).<br>
Example:
```lua
bit32.rshift(8, 3) == 1 -- (1000 >> 3 = 0001, in binary)
```

<b>bit32</b>.lshift(x, disp)<br>
Description: Equivalent to `x << disp` (logical left shift, fills with zeros).<br>
Example:
```lua
bit32.lshift(1, 3) == 8 -- (0001 << 3 = 1000, in binary)
```

<b>bit32</b>.arshift(x, disp)<br>
Description: Works like `rshift`, but preserves the MSB (sign bit).<br>
Example:
```lua
bit32.arshift(-8, 1) == -4 -- (0xFFFFFFF8 >> 1 = 0xFFFFFFFC, in hexadecimal)
```

<b>bit32</b>.band(...)<br>
Description: Combines all arguments using the `&` (bitwise AND) operator.<br>
Example:
```lua
bit32.band(1, 2, 3) == 0 -- (001 & 010 & 011 = 000, in binary)
```

<b>bit32</b>.btest(...) -> boolean<br>
Description: Combines all arguments using `&` and returns `true` if the result is different from `0` (`false` if equal to `0`).<br>
Example:
```lua
bit32.btest(1, 2, 3) == false -- (000 ~= 0 is false)
```

<b>bit32</b>.bor(...)<br>
Description: Combines all arguments using the `|` (bitwise OR) operator.<br>
Example:
```lua
bit32.bor(1, 10, 100) == 111 -- (0001 | 1010 | 0110 0100 = 0110 1111, in binary)
```

<b>bit32</b>.bxor(...)<br>
Description: Combines all arguments using the `~` (bitwise XOR) operator.<br>
Example:
```lua
bit32.bxor(3, 7, 15) == 11 -- ((0011 ~ 0111) ~ 1111 = 1011, in binary)
```

<b>bit32</b>.bnot(x)<br>
Description: Returns the bitwise NOT of `x`.<br>
Example:
```lua
bit32.bnot(-1) == 0 -- (~0xFFFFFFFF = 0x00000000, in hexadecimal)
```

<b>bit32</b>.rrotate(x, disp)<br>
Description: Equivalent to `x >> disp`, but bits shifted out on the right wrap around to the left (MSB).<br>
Example:
```lua
bit32.rrotate(1, 1) == 2147483648 -- (0x00000001 -> 0x80000000, in hexadecimal)
```

<b>bit32</b>.lrotate(x, disp)<br>
Description: Equivalent to `x << disp`, but bits shifted out on the left wrap around to the right (LSB).<br>
Example:
```lua
bit32.lrotate(2147483648, 1) == 1 -- (0x80000000 -> 0x00000001, in hexadecimal)
```

<b>bit32</b>.extract(n, field, width)<br>
Description: Extracts a 0-indexed bit field of size `width` (default `1`) from `n`.<br>
**Remember: If you're using hexadecimal, `field` and `width` are still counted in bits (4 bits per hex digit)!**<br>
Example:
```lua
bit32.extract(0xFFFFFFFF, 0, 16) == 0x0000FFFF -- (0xFFFF|FFFF| -> 0x0000FFFF, in hexadecimal)
```

<b>bit32</b>.replace(n, v, field, width)<br>
Description: Returns `n` with the bit field starting at `field` (of size `width`, default `1`) replaced by the lowest bits of `v`.<br>
Example:
```lua
bit32.replace(0x12345678, 0x87654321, 16, 8) == 0x12215678 -- (0x12|34|5678 with 0x876543|21| -> 0x12|21|5678)
```

## Also, for those wordering about the bit64 functions: It's the same functions, but with the 64-bit limit and conventions instead!
</details>
