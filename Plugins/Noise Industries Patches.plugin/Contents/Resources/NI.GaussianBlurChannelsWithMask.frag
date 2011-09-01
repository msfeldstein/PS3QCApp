uniform float invert;
uniform vec4 blurMask; // isolate out individual channel for blurring.
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

varying vec2 texcoord0;
varying vec2 texcoord1;

varying vec2 samplerCoord0;
varying vec2 samplerCoord1;
varying vec2 samplerCoord2;
varying vec2 samplerCoord3;
varying vec2 samplerCoord4;
varying vec2 samplerCoord5;
varying vec2 samplerCoord6;
varying vec2 samplerCoord7;

float blurChannel(sampler2DRect tex0, float blur, vec4 mask)
{
	// create new sample coords based on our blur.
	vec2 coord0 = samplerCoord0 * blur; 
	vec2 coord1 = samplerCoord1 * blur; 
	vec2 coord2 = samplerCoord2 * blur; 
	vec2 coord3 = samplerCoord3 * blur; 
	vec2 coord4 = samplerCoord4 * blur; 
	vec2 coord5 = samplerCoord5 * blur; 
	vec2 coord6 = samplerCoord6 * blur; 
	vec2 coord7 = samplerCoord7 * blur;
	 
	// sample our new coords on our incoming video.
	vec4 result = vec4(0.0);

 	vec4 original = texture2DRect(tex0,texcoord0) * 0.18;
	result += original;
 	result += texture2DRect(tex0,texcoord0 + coord0) * 0.15;
	result += texture2DRect(tex0,texcoord0 + coord1) * 0.12;
	result += texture2DRect(tex0,texcoord0 + coord2) * 0.09;
	result += texture2DRect(tex0,texcoord0 + coord3) * 0.05;
                                 
	result += texture2DRect(tex0,texcoord0 + coord4) * 0.15;
	result += texture2DRect(tex0,texcoord0 + coord5) * 0.12;
	result += texture2DRect(tex0,texcoord0 + coord6) * 0.09;
	result += texture2DRect(tex0,texcoord0 + coord7) * 0.05;

	return dot(result, mask);
} 

void main (void) 
{ 
	// sample our textures 	
	vec4 blur = texture2DRect(tex1, texcoord1); // blur amount for specific channel
	
	// invert ?
	blur = mix(blur, 1.0 - blur, invert);

	// this is horribly slow.
	vec4 result = vec4(0.0);
	result.r = blurChannel(tex0, blur.r, vec4(1.0, 0.0, 0.0, 0.0));
	result.g = blurChannel(tex0, blur.g, vec4(0.0, 1.0, 0.0, 0.0));
	result.b = blurChannel(tex0, blur.b, vec4(0.0, 0.0, 1.0, 0.0));
	result.a = blurChannel(tex0, blur.a, vec4(0.0, 0.0, 0.0, 1.0));	
	
	gl_FragColor = result;
} 
