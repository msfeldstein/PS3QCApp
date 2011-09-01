#version 120 
#extension GL_EXT_geometry_shader4 : enable

// the size of our quad
uniform float size;
uniform vec2 imageSize;

// plan:

// input has 2 vertices
// x ------ y (line begin/end)

// "extrude" out in y based on current requested line width, make new texture coords
// x1 ---- y1
//  |      |
// x2------y2

void main(void)
{
	//increment variable
	int i;

	vec4 modelviewCoordinate;

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
//

		// 1 & 3
		// change the incoming modelview coordinate, into clipping space, while creating a new modelview based coordinate.
		modelviewCoordinate = gl_PositionIn[i];
		modelviewCoordinate.y -= size;
		
		gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * modelviewCoordinate;		
		
		gl_TexCoord[0] = gl_TexCoordIn[i][0];
		gl_TexCoord[0].y += size * imageSize.y * 0.5; // (Image Height in pixels) 
	
		gl_FrontColor = gl_FrontColorIn[i];

		EmitVertex();
	
		// 2 & 4 - same thing
		// change the incoming modelview coordinate, into clipping space, while creating a new modelview based coordinate.
		modelviewCoordinate = gl_PositionIn[i];
		modelviewCoordinate.y += size;
		
		gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * modelviewCoordinate;		
			
		gl_TexCoord[0] = gl_TexCoordIn[i][0];
		gl_TexCoord[0].y -= size * imageSize.y * 0.5; // (Image Height in pixels) 

		gl_FrontColor = gl_FrontColorIn[i];

		EmitVertex();
		
		// 3 and 4 are done in the next loop
	}
	EndPrimitive();	
}	