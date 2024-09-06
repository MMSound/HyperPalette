/// @description Drawing
draw_sprite_ext(sprMegaMan, 0, 160, 96, 1.00, 1.00, 0, HYPERPAL_COL_PAL1, 1.0);

gpu_set_blendmode(bm_add);
draw_sprite_ext(sprSearchy, image, mouse_x, 64, 1.00, 1.00, 0, HYPERPAL_COL_PAL2, 1.0);
gpu_set_blendmode(bm_normal);

draw_sprite_ext(sprHyperPalette, 0, 16, 16, 2.00, 2.00, 0, HYPERPAL_COL_PAL1, 1.0);
draw_sprite_ext(sprHyperPalette, 0, 18, 16, 2.00, 2.00, 0, HYPERPAL_COL_PAL2, 1.0);
draw_sprite_ext(sprHyperPalette, 0, 20, 16, 2.00, 2.00, 0, HYPERPAL_COL_PAL3, 1.0);