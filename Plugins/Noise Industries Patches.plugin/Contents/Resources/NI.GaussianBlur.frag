uniform sampler2DRect tex0;

varying vec2 texcoord0;
varying vec2 samplerCoord0;
varying vec2 samplerCoord1;
varying vec2 samplerCoord2;
varying vec2 samplerCoord3;

void main (void) 
{ 	 
	// sample our new coords on our incoming video.
	vec4 result = vec4(0.0);

 	result += texture2DRect(tex0,texcoord0) * 0.18;
 	result += texture2DRect(tex0,texcoord0 + samplerCoord0) * 0.15;
	result += texture2DRect(tex0,texcoord0 + samplerCoord1) * 0.12;
	result += texture2DRect(tex0,texcoord0 + samplerCoord2) * 0.09;
	result += texture2DRect(tex0,texcoord0 + samplerCoord3) * 0.05;
                   
	// indirection	- flip our coords now looking at the left
	vec2 coord0 = samplerCoord0 * -1.0;
	vec2 coord1 = samplerCoord1 * -1.0;
	vec2 coord2 = samplerCoord2 * -1.0;
	vec2 coord3 = samplerCoord3 * -1.0;											 
											                 
	result += texture2DRect(tex0,texcoord0 + coord0) * 0.15;
	result += texture2DRect(tex0,texcoord0 + coord1) * 0.12;
	result += texture2DRect(tex0,texcoord0 + coord2) * 0.09;
	result += texture2DRect(tex0,texcoord0 + coord3) * 0.05;

	gl_FragColor = result;
} 
