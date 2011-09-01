
void main()
{	
	//Transform the vertex (ModelViewProj matrix)
	gl_Position = ftransform();
		
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;

}