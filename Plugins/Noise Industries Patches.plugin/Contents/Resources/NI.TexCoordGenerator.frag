uniform vec2 destSize;

void main (void)
{
	gl_FragColor =  vec4((floor(gl_FragCoord.x) / (destSize.x - 1.0) - 0.0),  ((floor(gl_FragCoord.y) / (destSize.y - 1.0)) - 0.0), 0.0 , 1.0);
}