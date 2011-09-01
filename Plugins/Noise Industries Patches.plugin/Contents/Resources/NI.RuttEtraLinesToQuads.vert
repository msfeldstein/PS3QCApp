
void main()
{		
	// basic pass through shader.
	
	// normally one does this, but we are going to create the clip space coords in the geom shader
	// gl_Position = ftransform();
	// so we do this.
	gl_Position = gl_Vertex;
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
	gl_FrontColor = gl_Color;

}