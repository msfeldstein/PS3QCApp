#version 120 
#extension GL_EXT_geometry_shader4 : enable

// the size of our quad
varying in float size[];

uniform float aspect;

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
		
		// no need to draw anything unless we can see it.
		if(gl_FrontColorIn[i].a > 0.0)
		{
		
			// 1
			gl_Position = vec4(gl_PositionIn[i].x - size[i] * 0.5, gl_PositionIn[i].y - size[i] * 0.5 * aspect, gl_PositionIn[i].z, gl_PositionIn[i].w);
			gl_TexCoord[0] = vec4(0.0, 0.0, 0.0, 0.0);
			gl_FrontColor = gl_FrontColorIn[i];
			EmitVertex();
		
			// 2
			gl_Position = vec4(gl_PositionIn[i].x - size[i] * 0.5, gl_PositionIn[i].y + size[i] * 0.5 * aspect,gl_PositionIn[i].z, gl_PositionIn[i].w);
			gl_TexCoord[0] = vec4(0.0, 1.0, 0.0, 0.0);
			gl_FrontColor = gl_FrontColorIn[i];
			EmitVertex();
			
			// 3
			gl_Position = vec4(gl_PositionIn[i].x + size[i] * 0.5, gl_PositionIn[i].y - size[i] * 0.5 * aspect, gl_PositionIn[i].z, gl_PositionIn[i].w);
			gl_TexCoord[0] = vec4(1.0, 0.0, 0.0, 0.0);
			gl_FrontColor = gl_FrontColorIn[i];
			EmitVertex();
			
			// 4
			gl_Position = vec4(gl_PositionIn[i].x + size[i] * 0.5, gl_PositionIn[i].y + size[i] * 0.5 * aspect, gl_PositionIn[i].z, gl_PositionIn[i].w);
			gl_TexCoord[0] = vec4(1.0, 1.0, 0.0, 0.0);
			gl_FrontColor = gl_FrontColorIn[i];
			EmitVertex();
		
		}
	}
	EndPrimitive();	
}