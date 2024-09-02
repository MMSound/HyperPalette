//this script contains functions to better enable the use of HyperPalette

//define macros
#macro HYPERPAL_MAX_COLORS 32
#macro HYPERPAL_MAX_PALETTES 7
#macro HYPERPAL_COL_PAL0 c_white
#macro HYPERPAL_COL_PAL1 c_red
#macro HYPERPAL_COL_PAL2 c_lime
#macro HYPERPAL_COL_PAL3 c_yellow
#macro HYPERPAL_COL_PAL4 c_blue
#macro HYPERPAL_COL_PAL5 c_fuchsia
#macro HYPERPAL_COL_PAL6 c_aqua

/// @description call this once at the beginning of your game to initialize hyperpalette - set <_rand> to true to make it initialize with a semi-randomized palette
function hyperpalette_init(_rand = false)
{
	if (shader_is_compiled(shdHyperPalette))
	{
		global.colorPaletteR = array_create(HYPERPAL_MAX_PALETTES * HYPERPAL_MAX_COLORS);
		global.colorPaletteG = array_create(HYPERPAL_MAX_PALETTES * HYPERPAL_MAX_COLORS);
		global.colorPaletteB = array_create(HYPERPAL_MAX_PALETTES * HYPERPAL_MAX_COLORS);
		global.hyperPaletteUniforms =
		[
			shader_get_uniform(shdHyperPalette, "paletteR"),
			shader_get_uniform(shdHyperPalette, "paletteG"),
			shader_get_uniform(shdHyperPalette, "paletteB"),
		];
	
		if (_rand)
		{
			global.colorPaletteR = [0];
			global.colorPaletteG = [0];
			global.colorPaletteB = [0];
			for (var i = 1; i < (HYPERPAL_MAX_PALETTES * HYPERPAL_MAX_COLORS); i++)
			{
				var _val = lerp(0, 1, (i / (HYPERPAL_MAX_PALETTES * HYPERPAL_MAX_COLORS)));
				global.colorPaletteR[i] = _val;
				global.colorPaletteG[i] = (irandom(255) / 255);
				global.colorPaletteB[i] = _val;
			}
		}
	}
	else
	{
		show_message("HyperPalette is not correctly initalized! Edit this code to handle this shader being uncompiled @fnsHyperPalette line 45. Otherwise, the game will crash.");
		//edit here - this is up to you how you want to deal with hyperpalette not working
	}
}

/// @description change a color on the palette - nothing is preventing you from modifying them directly but hopefully this makes them simpler
function hyperpalette_change_color(_new = $FFFFFF, _col = 0, _pal = 0)
{
	_pal = clamp(_pal, 0, HYPERPAL_MAX_PALETTES);
	_col = clamp(_col, 0, HYPERPAL_MAX_COLORS);
	global.colorPaletteR[_col * _pal] = (color_get_red(_new) / 255);
	global.colorPaletteG[_col * _pal] = (color_get_green(_new) / 255);
	global.colorPaletteB[_col * _pal] = (color_get_blue(_new) / 255);
	
}

/// @description call this to set hyperpalette in your control object - again, this should be the only place you need to call this shader if you've set everything up correctly
function hyperpalette_shader_set()
{
	shader_set(shdHyperPalette);
	shader_set_uniform_f_array(global.hyperPaletteUniforms[0], global.colorPaletteR);
	shader_set_uniform_f_array(global.hyperPaletteUniforms[1], global.colorPaletteG);
	shader_set_uniform_f_array(global.hyperPaletteUniforms[2], global.colorPaletteB);	
}