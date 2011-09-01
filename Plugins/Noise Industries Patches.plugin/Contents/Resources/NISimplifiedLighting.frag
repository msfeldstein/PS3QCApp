varying float intensity;
varying float lightAngle;

uniform sampler2DRect texture;

void main()
{
	vec4 color = texture2DRect(texture, gl_TexCoord[0].xy);
	
	color.rgb *= clamp( ( intensity / lightAngle ) + (1.0 - intensity)/3.0, 0.0, 1.0);
	
	gl_FragColor = color * gl_Color;
}