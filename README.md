Hello!

This is HyperPalette, a shader- and code-based palette swap system for GameMaker (Studio 2). I've made a video detailing how it works and why I made it here: https://www.youtube.com/watch?v=YNZ2h2z4Eqg
In summary, however, the reason I've made this is because I was dissatisfied with the inflexibility of texture-based palette swap systems, and the unwieldiness of the tables required for variable-based palette swap systems.
HyperPalette has a few limitations and a few requirements to be able to work properly:
1. 218 colors are usable onscreen total
2. Every sprite can use up to 31 colors (for now)
3. Every sprite resource in the project must use the following color palette to be able to be detected by the shader properly:
