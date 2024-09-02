/// @description Switch shader setting
if (keyboard_check_pressed(vk_space))
{
	doShader = !doShader;
	hyperpalette_change_color(irandom(156779), irandom(HYPERPAL_MAX_COLORS), irandom(HYPERPAL_MAX_PALETTES));
}

//also for demonstration purposes