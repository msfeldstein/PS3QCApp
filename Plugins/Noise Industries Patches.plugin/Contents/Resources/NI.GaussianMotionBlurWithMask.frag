//setup for 2 texture
uniform float amount;
uniform float angle;
uniform float invert;
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

varying vec2 samplerCoord0;
varying vec2 samplerCoord1;
varying vec2 samplerCoord2;
varying vec2 samplerCoord3;
varying vec2 samplerCoord4;
varying vec2 samplerCoord5;
varying vec2 samplerCoord6;
varying vec2 samplerCoord7;

varying mat2 rotmat;
varying mat2 irotmat;

varying vec2 texcoord0;
uniform vec2 texdim0;
varying vec2 texcoord1;

const vec4 lumacoeff = vec4(0.2126,0.7152,0.0722, 0.0);

const vec2 anchor = vec2(0.5);

void main()
{
	// sample our textures 	
	float blur = dot(lumacoeff, texture2DRect(tex1, texcoord1)); // blur amount 
	
	// invert ?
	blur = mix(blur, 1.0 - blur, invert);

	// normalized texture coordinates:
	vec2 point = texcoord0 ; ///texdim0;

	// create new coords based on our texture coordinate, and rotate them based on our blur.
	vec2 coord0 = (point - anchor * texdim0) * rotmat + anchor * texdim0; 
	vec2 coord1 = (point - anchor * texdim0) * rotmat + anchor * texdim0; 
	vec2 coord2 = (point - anchor * texdim0) * rotmat + anchor * texdim0; 
	vec2 coord3 = (point - anchor * texdim0) * rotmat + anchor * texdim0; 
	vec2 coord4 = (point - anchor * texdim0) * rotmat + anchor * texdim0; 
	vec2 coord5 = (point - anchor * texdim0) * rotmat + anchor * texdim0; 
	vec2 coord6 = (point - anchor * texdim0) * rotmat + anchor * texdim0; 
	vec2 coord7 = (point - anchor * texdim0) * rotmat + anchor * texdim0;

	// blur 
	coord0 += (samplerCoord0) * blur; 
	coord1 += (samplerCoord1) * blur; 
	coord2 += (samplerCoord2) * blur; 
	coord3 += (samplerCoord3) * blur; 
	coord4 += (samplerCoord4) * blur; 
	coord5 += (samplerCoord5) * blur; 
	coord6 += (samplerCoord6) * blur; 
	coord7 += (samplerCoord7) * blur;

	// unrotate our coordinates
	coord0 = (coord0 - anchor * texdim0) * irotmat + anchor * texdim0; 
	coord1 = (coord1 - anchor * texdim0) * irotmat + anchor * texdim0; 
	coord2 = (coord2 - anchor * texdim0) * irotmat + anchor * texdim0; 
	coord3 = (coord3 - anchor * texdim0) * irotmat + anchor * texdim0; 
	coord4 = (coord4 - anchor * texdim0) * irotmat + anchor * texdim0; 
	coord5 = (coord5 - anchor * texdim0) * irotmat + anchor * texdim0; 
	coord6 = (coord6 - anchor * texdim0) * irotmat + anchor * texdim0; 
	coord7 = (coord7 - anchor * texdim0) * irotmat + anchor * texdim0;

	// sample our new coords on our incoming video.
	vec4 result = vec4(0.0);

 	result += texture2DRect(tex0, texcoord0) * 0.18;
 	result += texture2DRect(tex0, coord0) * 0.15;
	result += texture2DRect(tex0, coord1) * 0.12;
	result += texture2DRect(tex0, coord2) * 0.09;
	result += texture2DRect(tex0, coord3) * 0.05;
                                  
	result += texture2DRect(tex0, coord4) * 0.15;
	result += texture2DRect(tex0, coord5) * 0.12;
	result += texture2DRect(tex0, coord6) * 0.09;
	result += texture2DRect(tex0, coord7) * 0.05;
	
	gl_FragColor = result;
	
//	gl_FragColor =  texture2DRect(tex0, texcoord0);

}