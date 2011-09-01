
varying vec2 texcoord0;

uniform sampler2DRect tex0;
uniform vec2 destSize;

void main (void)
{
	vec4 pixel = texture2DRect(tex0, texcoord0);	
	gl_FragColor =  vec4( floor(gl_FragCoord.x) / (destSize.x - 1.0),  floor(gl_FragCoord.y) / (destSize.y - 1.0), 0.0, 1.0);
}

//varying vec2 texcoord0;
////uniform sampler2DRect tex0;
//uniform vec2 imageSize;
////uniform float coef;
//
////const vec4 lumcoeff = vec4(0.299,0.587,0.114,0.);
//
//void main (void)
//{
//	//vec4 pixel = texture2DRect(tex0, texcoord0);
//	
//	// write our 'vertices on 0th color attachment and actual 'color' pixels on attachment 1.
//	gl_FragData[0] = vec4((texcoord0.x  / imageSize.x), 0.0, 1.0 - (texcoord0.y / imageSize.y) , 1.0);
////	gl_FragData[0] = vec4((texcoord0.x), 0.0, 1.0 - (texcoord0.y) , 1.0);
//}