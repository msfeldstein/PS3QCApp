uniform float lightAngleCos;

varying float intensity;
varying float lightAngle;

void main()
{
	vec3 normal = normalize( gl_NormalMatrix * gl_Normal ); 
	vec3 light_vector = normalize(gl_LightSource[0].position.xyz);

	intensity = clamp( dot( normal, light_vector ), 0.0, 1.0 );
	lightAngle = lightAngleCos * gl_LightSource[0].diffuse.a;

	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor = gl_Color;
	gl_TexCoord[0] = gl_TextureMatrix[0] * gl_MultiTexCoord0;
}
