varying vec2 texcoord0;
varying vec2 texcoord1;
varying vec2 texcoord2;

// define our rectangular texture samplers 
uniform sampler2DRect tex0;
uniform float amount;
uniform float scanlineSize;
uniform float scanlinePeriod;
uniform float scanlineHardness;

// dont use 
const vec3 lumacoeff = vec3(0.2126,0.7152,0.0722);
void main (void) 
{ 
		vec4 scanlines;
//		scanlines = vec4(floor(mod(texcoord0.y + 1.0, scanlineSize))); // was 4
		scanlines = vec4(floor(mod((texcoord0.y * scanlineSize), scanlinePeriod))); // was 4
		scanlines = clamp(scanlines, 0.0, 1.0);
		
		vec4 above = texture2DRect(tex0, texcoord1);
		vec4 below = texture2DRect(tex0, texcoord2);
		
		vec4 result = texture2DRect(tex0, texcoord0);
	
		// depending on brightness of the 2 above/below pixels
		// we mix out our scanline because the phosphor would bleed over it.
		float aboveLuma = dot(above.rgb, lumacoeff);
		float belowLuma = dot(below.rgb, lumacoeff);
		//float aboveLuma = (above.r + above.g + above.b) / 3.0;
		//float belowLuma = (below.r + below.g + below.b) / 3.0;
		
		//float possibleMaxLuma = dot(vec4(1.0), lumacoeff);
		
		float mixAmount = (aboveLuma + belowLuma) / 2.0; //(possibleMaxLuma * 2.0);
		mixAmount = pow(mixAmount, 1.0/2.2);
		clamp(0.0, 1.0, mixAmount);
		mixAmount = 1.0 - mixAmount;
		
		gl_FragColor = mix(result, result * scanlines, mix(mixAmount, 1.0, scanlineHardness)  * amount);
}