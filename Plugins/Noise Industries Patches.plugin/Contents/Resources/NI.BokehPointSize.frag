// texcoords
//varying vec2 texcoord0;
//varying mat2 rotmat;

// samplers
uniform sampler2D tex0;
uniform vec2 dim;

void main (void)
{
	// rotate sprite
	//vec2 point = texcoord0; 
//	vec2 point = ((texcoord0 + vec2(0.5)) * rotmat) - vec2(0.5);
//	vec2 point = texcoord0 * rotmat ;

	//gl_FragColor = vec4(point.x, point.y, 0.0, 1.0);
	//gl_FragColor = vec4(point.x/dim.x, point.y/dim.y, 0.0, 1.0);
	gl_FragColor = gl_Color * texture2D(tex0, gl_TexCoord[0].xy);

}