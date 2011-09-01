uniform sampler2DRect image;
uniform sampler2DRect lumaSource;

varying vec2 texcoord0;
/*varying vec2 texcoord1;
varying vec2 texcoord2;
varying vec2 texcoord3;
varying vec2 texcoord4;
varying vec2 texcoord5;
varying vec2 texcoord6;
varying vec2 texcoord7;
*/
const vec4 lumcoeff = vec4(0.299,0.587,0.114,0.);

void main()
{

	vec4 dilate = texture2DRect(image,texcoord0);
	float luma = dot(dilate, lumcoeff);
	
	//vec4 dilate = texture2DRect(image, 0.5 * (texcoord3 + texcoord4));
	
/*	dilate = max(dilate, texture2DRect(image, texcoord0));
	dilate = max(dilate, texture2DRect(image, texcoord1));
	dilate = max(dilate, texture2DRect(image, texcoord2));
	dilate = max(dilate, texture2DRect(image, texcoord3));
	dilate = max(dilate, texture2DRect(image, texcoord4));
	dilate = max(dilate, texture2DRect(image, texcoord5));
	dilate = max(dilate, texture2DRect(image, texcoord6));
	dilate = max(dilate, texture2DRect(image, texcoord7));
*/
	gl_FragColor = dilate;
	gl_FragColor.a = luma;
}