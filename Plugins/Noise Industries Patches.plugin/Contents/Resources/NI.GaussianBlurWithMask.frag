varying vec2 texcoord0;
varying vec2 texcoord1;

varying vec2 samplerCoord0;
varying vec2 samplerCoord1;
varying vec2 samplerCoord2;
varying vec2 samplerCoord3;

uniform float invert;
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

const vec4 lumacoeff = vec4(0.2126,0.7152,0.0722, 0.0);

void main (void) 
{ 
	// sample our textures
	vec4 blurColor = texture2DRect(tex1, texcoord1);
	float blur = dot(lumacoeff, blurColor); // blur amount 
	
	blur = clamp(blur, 0.0, 1.0);

	// invert ?
	blur = mix(blur, 1.0 - blur, invert);

	// create new sample coords based on our blur.
	vec2 coord0 = samplerCoord0 * blur; 
	vec2 coord1 = samplerCoord1 * blur; 
	vec2 coord2 = samplerCoord2 * blur; 
	vec2 coord3 = samplerCoord3 * blur; 
	 
	// sample our new coords on our incoming video.
	vec4 result = vec4(0.0);

 	result += texture2DRect(tex0,texcoord0) * 0.18;
 	result += texture2DRect(tex0,texcoord0 + coord0) * 0.15;
	result += texture2DRect(tex0,texcoord0 + coord1) * 0.12;
	result += texture2DRect(tex0,texcoord0 + coord2) * 0.09;
	result += texture2DRect(tex0,texcoord0 + coord3) * 0.05;

	// indirection	- flip our coords now looking at the left
	coord0 *= -1.0;
	coord1 *= -1.0;
	coord2 *= -1.0;
	coord3 *= -1.0;							 
									     
	result += texture2DRect(tex0,texcoord0 + coord0) * 0.15;
	result += texture2DRect(tex0,texcoord0 + coord1) * 0.12;
	result += texture2DRect(tex0,texcoord0 + coord2) * 0.09;
	result += texture2DRect(tex0,texcoord0 + coord3) * 0.05;

	gl_FragColor = result;
} 
