Hello!

This is HyperPalette, a shader- and code-based palette swap system for GameMaker (Studio 2). I've made a video detailing how it works and why I made it here: https://www.youtube.com/watch?v=YNZ2h2z4Eqg
In summary, however, the reason I've made this is because I was dissatisfied with the inflexibility of texture-based palette swap systems, and the unwieldiness of the tables required for variable-based palette swap systems.
HyperPalette has a few limitations and a few requirements to be able to work properly:
1. 217 colors are usable onscreen total
2. Every sprite can use up to 31 colors (for now)
3. Every sprite resource in the project must use the following color palette to be able to be detected by the shader properly:
![hyperpal_base](https://github.com/user-attachments/assets/2ba0d8a6-b9b5-46e4-9169-eec6dd23b120)

If 218 colors can be used onscreen, how do you access that? Well, it's something like older game consoles' "sprite palette" setups.
Each sprite palette has up to 31 colors, but you can change the image_blend (or the blend color in functions like draw_sprite_ext()) to choose between which of the 7 available sprite palettes you want to use:
0. c_white
1. c_red
2. c_lime
3. c_yellow
4. c_blue
5. c_fuchsia
6. c_aqua

To use HyperPalette in your project, the only assets from this repository you need are the script "fnsHyperPalette" and the shader "shdHyperPalette".
Further documentation is available inside objExample and the aforementioned assets.
While this system is very restrictive on how it allows you to use sprite assets in your project, I believe that it makes it easier to emulate the palette effects of older consoles with only 1 necessary shader call (as opposed to several), and that was the primary rationale behind the project.
I hope you get some use out of this, and I hope I get some use out of this. Feel free to message me with questions @qm72 on Discord, or email me at minimacrodx@gmail.com.
Thanks!
