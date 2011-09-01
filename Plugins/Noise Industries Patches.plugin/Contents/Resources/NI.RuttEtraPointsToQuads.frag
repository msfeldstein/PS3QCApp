uniform sampler2D point;
uniform sampler2DRect texture;

void main(void)
{	
	vec4 color = texture2D(point, gl_TexCoord[1].xy) * texture2DRect(texture, gl_TexCoord[0].xy);

	//if(color.a <= 0.0)
//		discard; 

	gl_FragColor = color;
}