varying vec2 texcoord0;
varying vec2 texcoord1;
varying vec2 texcoord2;

uniform vec2 amount;
// define our rectangular texture samplers 
uniform sampler2DRect tex0;	

void main (void) 
{ 
	vec4 original = texture2DRect(tex0,texcoord0);

	vec4 blured = original;
	vec4 pass1 = texture2DRect(tex0,texcoord1);
	vec4 pass2 = texture2DRect(tex0,texcoord2);
					
//	blured.rgb /= blured.a;
//	pass1.rgb /= pass1.a;
//	pass2.rgb /= pass2.a;

	if(pass1.a > 0.5)
	{
		blured += pass1;
		blured *= 0.66666;
	}
	if(pass2.a > 0.5)
	{
		blured += pass2;
		blured *= 0.66666;
	}

	//gl_FragColor = blured;
	gl_FragColor = max(original, blured);	
	//gl_FragColor = mix(original, blured, amount.x);
}
