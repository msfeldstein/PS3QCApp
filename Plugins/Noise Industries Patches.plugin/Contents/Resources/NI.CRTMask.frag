varying vec2 texcoord0;
varying vec2 crtcoord0;

uniform vec2 texdim0;
uniform vec2 texdim1;

//uniform float crtscale;
//varying mat2 scale;
// define our rectangular texture samplers 
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform float mixamount;

const float tileSize = 12.0;

void main (void) 
{ 
	vec4 videoIn = texture2DRect(tex0,texcoord0);
	
	// our CRT mask image is 12x12 pixels , with a 4 pixel array repeating pattern..
	// we have to do this because texture rect does not have GL_REPEAT texture wrap mode.
	vec2 crtcoord =  mod(crtcoord0, texdim1);
//	vec2 crtcoord =  crtcoord0 / crtscale;


	vec4 crt = texture2DRect(tex1, crtcoord);
	
	// normal output for our 3 rgb phosphors via stellas algo (which im not sure where it came from..)
	//vec4 result = (videoIn * crt * 1.05) + 0.07;

//	vec4 result = mix(videoIn, clamp(pow(videoIn,crt), 0.0, 1.0) , mixamount);
	vec4 result = mix(videoIn, videoIn * crt, mixamount);

	// vec4 result = crt;
	result.a = videoIn.a;
			
	gl_FragColor = result;
}
