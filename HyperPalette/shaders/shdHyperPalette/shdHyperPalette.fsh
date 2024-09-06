//
// Recolor based on the currently on-screen color
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const int maxCol = 32; //should be equal to HYPERPAL_MAX_COLORS
const int divCol = (256 / maxCol);
//const float halfWhite = 0.49803;
uniform float paletteR[7 * maxCol]; // the 7 here should be equal to HYPERPAL_MAX_PALETTES
uniform float paletteG[7 * maxCol];
uniform float paletteB[7 * maxCol];

void main()
{
    vec4 oldCol = texture2D(gm_BaseTexture, v_vTexcoord);
	
	//get the grayscale color we should use to calculate the index - we want to know how many of these aren't 0 so we can get a correct average
	int avg = (int(oldCol.r != 0.0) + int(oldCol.g != 0.0) + int(oldCol.b != 0.0));
	float grayCol = float((oldCol.r + oldCol.g + oldCol.b) / float(avg));
	
	//now we can figure out the index and "bit-shift" (not really but the math is the same) to the right section of the palette
	int index = int((grayCol * 255.0) / float(divCol)); 
	index += int(((float(oldCol.r != 0.0) * 1.0) + (float(oldCol.g != 0.0) * 2.0) + (float(oldCol.b != 0.0) * 4.0)) * (float(maxCol) * float(avg < 3))); //shift with normal colors - last check here lets us know if our index is actually on palette 0 and if so do not shift
	
	gl_FragColor = vec4(paletteR[index], paletteG[index], paletteB[index], oldCol.a);   
}

/*
	when i was first writing this system, it only had 16 gray levels per palette, and i needed a kind of "offset" value when finding the index to account for off-by-one errors
	however, when expanding it to 32 gray levels per palette, it seemed that that correction was no longer necessary
	here is how i did that though in case you decide to expand/reduce the levels yourself:
	line 23: int index = int((grayCol * 255.0) / (float(divCol) + sign(grayCol - halfWhite)));
	also uncomment line 9
	what this does is subtract 1 from divCol if the gray was above rgb 127, 127, 127, and add 1 if it was under
	i'm still not sure why it worked but it did so it's worth writing down here
*/