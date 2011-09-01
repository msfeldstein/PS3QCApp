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

uniform vec2 amount; 

void main()
{
    // perform standard transform on vertex
    gl_Position = ftransform();

    // transform texcoords
    texcoord0 = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
	texcoord1 = vec2(gl_TextureMatrix[1] * gl_MultiTexCoord1);
	
	samplerCoord0 = amount;
	samplerCoord1 = amount * 2.0;
	samplerCoord2 = amount * 3.0;
	samplerCoord3 = amount * 4.0;
	samplerCoord4 = -amount;
	samplerCoord5 = -amount * 2.0;
	samplerCoord6 = -amount * 3.0;
	samplerCoord7 = -amount * 4.0;
}