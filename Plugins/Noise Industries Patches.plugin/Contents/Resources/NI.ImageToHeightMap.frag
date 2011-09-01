varying vec2 texcoord0;

uniform sampler2DRect tex0;
uniform vec2 destSize;
uniform float coef;

const vec4 lumcoeff = vec4(0.299,0.587,0.114,0.);

void main (void)
{
	
	vec4 pixel = texture2DRect(tex0, texcoord0);
	float luma = dot(lumcoeff, pixel);
	
	gl_FragColor =  vec4((floor(gl_FragCoord.x) / (destSize.x - 1.0) - 0.0),  ((floor(gl_FragCoord.y) / (destSize.y - 1.0)) - 0.0), luma , 1.0);
}