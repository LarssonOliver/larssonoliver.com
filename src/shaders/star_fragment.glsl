precision highp float;
uniform sampler2D source;
uniform vec3 coreColor, haloColor;
uniform vec2 center, resolution;
uniform float coreRadius, haloFalloff, scale;
varying vec2 vUV;
void main() {
	vec4 s = texture2D(source, vUV);
	float d = length(gl_FragCoord.xy - center * resolution) / scale;
	if (d <= coreRadius) {
		gl_FragColor = vec4(coreColor, 1);
		return;
	}
	float e = 1.0 - exp(-(d - coreRadius) * haloFalloff);
	vec3 rgb = mix(coreColor, haloColor, e);
	rgb = mix(rgb, vec3(0,0,0), e);
	gl_FragColor = vec4(rgb + s.rgb, 1);
}
