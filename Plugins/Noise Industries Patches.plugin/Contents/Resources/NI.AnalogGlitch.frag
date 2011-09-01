// define our rectangular texture samplers 
uniform sampler2DRect tex0;
uniform sampler2DRect tex1;	// bars and distortion texture
uniform vec2 texdim0;

uniform float barsamount;	// changes bars amount
uniform float distortion;	// amount of distortion
uniform float vsync;		// sync
uniform float hsync;

uniform float embossMix;
uniform float embossWidth;

uniform float lumaContribution;

// define our varying texture coordinates 
varying vec2 texcoord0;
varying vec2 texcoord1;

void main (void) 
{ 		
	vec2 point = texcoord0/texdim0;
	vec2 original = point;
	
	// sync
	point += mod(vec2( hsync - mod((1.0 - distortion), 1.0), vsync), 1.0);
	
	vec4 bars = texture2DRect(tex1, vec2(0.0, texcoord1.y));
	bars = 1.0 - bars;
	
	// get rough luma 
	vec4 key = texture2DRect(tex0, (vec2(point.y, point.y)) * texdim0);
	//key += texture2DRect(tex0, (1.0 - vec2(point.y, point.y)) * texdim0);
//	key += bars;
//	key *= 0.5;
	
	//key *= 0.33;
	float d = key.r + key.g + key.b;
	d /= 3.0;
	
	point.x -= mix(1.0, d, lumaContribution) * (bars.x * distortion);	

	// wrap
	point = mod(point, 1.0);

	vec4 tex = texture2DRect(tex0, point * texdim0);
	
	// emboss
	vec2 texcoord1 = (point * texdim0) + vec2(-embossWidth, -embossWidth);
	vec2 texcoord2 = (point * texdim0) + vec2(0.0, -embossWidth);
	vec2 texcoord4 = (point * texdim0) + vec2(-embossWidth, 0.0);
	vec2 texcoord5 = (point * texdim0) + vec2( embossWidth, 0.0);
	vec2 texcoord7 = (point * texdim0) + vec2(0.0,  embossWidth);
	vec2 texcoord8 = (point * texdim0) + vec2( embossWidth,  embossWidth);
	
	vec4 embossed = texture2DRect(tex0, texcoord1);
	embossed += texture2DRect(tex0, texcoord2);
	embossed += texture2DRect(tex0, texcoord4); 
	embossed -= texture2DRect(tex0, texcoord5);
	embossed -= texture2DRect(tex0, texcoord7); 
	embossed -= texture2DRect(tex0, texcoord8); 
	embossed += vec4(0.5);
		
	vec4 result;
	result = mix(tex, embossed, embossMix);

	gl_FragColor = mix(result, bars , -barsamount);
} 


