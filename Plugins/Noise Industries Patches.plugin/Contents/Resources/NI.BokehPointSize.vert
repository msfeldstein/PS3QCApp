//varying vec2 texcoord0;
//varying mat2 rotmat;

uniform float bokehSize;

const vec4 lumcoeff = vec4(0.299,0.587,0.114,0.);

uniform vec2 imageDim;
uniform vec2 resolution;
uniform float minSize;
uniform float maxSize;
uniform float bokehSaturation;
uniform float bokehIntensity;

varying float size;

//uniform float bokehRotation;

void main (void)
{	
	// transform texcoords
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;		

	// normal vertices
	gl_Position = ftransform();

	// intensity of color from our precompute was passed in as alpha. 
	float luma = gl_Color.a;

	// the drawn color of our bokeh is based on the input color
	vec4 color = gl_Color;
	
	// adjust saturation via interpolation 
	color = mix(vec4(luma), gl_Color , bokehSaturation);
	clamp(color, 0.0, 1.0);
	
	// the size of our bokeh is modulated by the intensity of the color.
	//luma = pow(luma, 2.0);
	
	// modulate size of the bokeh based on brightness
	size = bokehSize * luma; 
	
	// modulate the point sprite alpha based on size &
	// normalized image size to point count density
	float density = 1.0 / (resolution.x * resolution.y);	
	//density = 1.0 - density;	
		
	//color.a = smoothstep(0.0, sin(1.5 * size) * 0.25 * size, bokehIntensity);
	color.a = mix(0.0, sin(3.1415926 * size) * 0.1 * size, bokehIntensity);

	gl_FrontColor = color;
}
