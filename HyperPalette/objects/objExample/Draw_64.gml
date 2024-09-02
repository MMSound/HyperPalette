/// @description Draw surface with shader applied

//the "doShader" stuff here is just so that i could present it better in the video
//all the code contained in this block is the proper way to set the shader's uniforms so use that
//however this shows one of the most important parts of the shader - you only need one call to it to use fullscreen palette swapping
if (doShader)
{
	hyperpalette_shader_set();
	draw_surface(application_surface, 0, 0);
	shader_reset();
}
else
{
	draw_surface(application_surface, 0, 0);
}

//draw "correct" palette laid out in the same way as the example sprite - you do not need this yourself
/*var _factor = 4;
for (var i = 0; i < HYPERPAL_MAX_PALETTES; i++)
{
	for (var j = 0; j < HYPERPAL_MAX_COLORS; j++)
	{
		var _index = (j + (i * HYPERPAL_MAX_COLORS));
		var _col = make_color_rgb((global.colorPaletteR[_index] * 255), (global.colorPaletteG[_index] * 255), (global.colorPaletteB[_index] * 255));
		var _x = 96;
		draw_rectangle_color((_x + (i * _factor)), (y + (j * _factor)), ((_x + ((i + 1) * _factor)) - 1), ((y + ((j + 1) * _factor)) - 1), _col, _col, _col, _col, false);
	}
}*/

//draw fps - you also do not need this yourself
draw_text(156, 160, $"{fps}\n{fps_real}");