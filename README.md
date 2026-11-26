< Thanks for using my **Bitx32-64** Module >

< You can see the documentation at my GitHub: Joao-Feijao >

< Some performance tips:
1 - The vararg functions (band, btest, bor and bxor) have a fast-path that is faster than C overhead when used with **<= 4 arguments**;
2 - The functions rrotate and lrotate ignore the displacement when it equals to 0, also being faster than C overhead. >