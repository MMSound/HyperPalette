/// @description Draw sprite
var _blend = [HYPERPAL_COL_PAL0, HYPERPAL_COL_PAL1, HYPERPAL_COL_PAL2, HYPERPAL_COL_PAL3, HYPERPAL_COL_PAL4, HYPERPAL_COL_PAL5, HYPERPAL_COL_PAL6];
var _factor = 4;
for (var i = 0; i < array_length(_blend); i++)
{
	draw_sprite_ext(sprHyperPalette, 0, (x + (i * _factor)), y, _factor, _factor, 0, _blend[i], 1.0);
}

/*
	when drawing sprites with hyperpalette, you can assign one of 7 available palettes to the sprite
	basically all it does is set the image_blend, but the shader uses this to determine which of the "sprite palettes" to use
	the macros are mainly for convenience
*/