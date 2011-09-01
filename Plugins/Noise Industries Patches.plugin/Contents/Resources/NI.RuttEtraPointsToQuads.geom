#version 120 
#extension GL_EXT_geometry_shader4 : enable

// the size of our quad
uniform float size;
uniform float aspect;
uniform vec2 imageSize;

void main(void)
{

	//increment variable
	int i;

	// make a quad
	for(i = 0; i< gl_VerticesIn; i++)
	{
	
//	triangle strip, 
//	so we draw
//		
//		2---4
//		|\  |
//		| * |
//		|  \|
//		1---3
//		*/
		
		// 1
		gl_Position = vec4(gl_PositionIn[i].x - size, gl_PositionIn[i].y - size * aspect, gl_PositionIn[i].z, gl_PositionIn[i].w);

		gl_TexCoord[0] = gl_TexCoordIn[i][0];
		gl_TexCoord[0].x -= size * imageSize.x * 0.5; // (Image Height in pixels) 
		gl_TexCoord[0].y -= size * imageSize.y * 0.5; // (Image Height in pixels) 
		gl_TexCoord[1] = vec4(0.0, 0.0, 0.0, 0.0);

	
		gl_FrontColor = vec4(1.0);// gl_FrontColorIn[i];
		EmitVertex();
	
		// 2
		gl_Position = vec4(gl_PositionIn[i].x - size, gl_PositionIn[i].y + size * aspect,gl_PositionIn[i].z, gl_PositionIn[i].w);

		gl_TexCoord[0] = gl_TexCoordIn[i][0];
		gl_TexCoord[0].x -= size * imageSize.x * 0.5; // (Image Height in pixels) 
		gl_TexCoord[0].y += size * imageSize.y * 0.5; // (Image Height in pixels) 
		gl_TexCoord[1] = vec4(0.0, 1.0, 0.0, 0.0);

		gl_FrontColor = vec4(1.0);//gl_FrontColorIn[i];
		EmitVertex();
		
		// 3
		gl_Position = vec4(gl_PositionIn[i].x + size, gl_PositionIn[i].y - size * aspect, gl_PositionIn[i].z, gl_PositionIn[i].w);

		gl_TexCoord[0] = gl_TexCoordIn[i][0];
		gl_TexCoord[0].x += size * imageSize.x * 0.5; // (Image Height in pixels) 
		gl_TexCoord[0].y -= size * imageSize.y * 0.5; // (Image Height in pixels) 
		gl_TexCoord[1] = vec4(1.0, 0.0, 0.0, 0.0);

		gl_FrontColor = vec4(1.0);//gl_FrontColorIn[i];
		EmitVertex();
		
		// 4
		gl_Position = vec4(gl_PositionIn[i].x + size, gl_PositionIn[i].y + size * aspect, gl_PositionIn[i].z, gl_PositionIn[i].w);

		gl_TexCoord[0] = gl_TexCoordIn[i][0];
		gl_TexCoord[0].x += size * imageSize.x * 0.5; // (Image Height in pixels) 
		gl_TexCoord[0].y += size * imageSize.y * 0.5; // (Image Height in pixels) 
		gl_TexCoord[1] = vec4(1.0, 1.0, 0.0, 0.0);

		gl_FrontColor = vec4(1.0);//gl_FrontColorIn[i];
		EmitVertex();
	}
	EndPrimitive();	
	
}