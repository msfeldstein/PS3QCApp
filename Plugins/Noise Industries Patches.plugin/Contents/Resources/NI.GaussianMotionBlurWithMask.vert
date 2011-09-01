varying vec2 texcoord0;
varying vec2 texcoord1;

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

uniform float amount; 
uniform float angle;

void main()
{
	float theta = radians(angle); 
	
	//vec2 finalAngle = vec2(cos(theta), sin(theta));
	
	// build a rotation matrix
	
	// dont need to compute this more than once..
	float cos = cos(theta);
	float sin = sin(theta);
	float negSin = sin(-theta);
	float negCos = cos(-theta);

	// rotation matrix
	rotmat = mat2 (cos,sin,-sin,cos);

	// inverse rotation matrix
	irotmat = mat2 (negCos,negSin,-negSin,negCos);

    // perform standard transform on vertex
    gl_Position = ftransform();

    // transform texcoords
    texcoord0 = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
	texcoord1 = vec2(gl_TextureMatrix[1] * gl_MultiTexCoord1);
	
	samplerCoord0 = vec2(amount, 0);
	samplerCoord1 = vec2(amount * 2.0, 0) ;
	samplerCoord2 = vec2(amount * 3.0, 0) ;
	samplerCoord3 = vec2(amount * 4.0, 0) ;
	samplerCoord4 = -vec2(amount, 0);
	samplerCoord5 = -vec2(amount * 2.0, 0) ;
	samplerCoord6 = -vec2(amount * 3.0, 0) ;
	samplerCoord7 = -vec2(amount + 4.0, 0) ;
}