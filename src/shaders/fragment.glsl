precision mediump float;

uniform float offset;
uniform vec2 mouse;
uniform vec2 resolution;

#define PI   3.1415

void main(void)
{
	// Canvas coords and size
	vec2 uv = (gl_FragCoord.xy / resolution.xy) - .5;
	uv.y *= resolution.y / resolution.x;
	vec3 dir = vec3(uv * 2., 1.);

	// Rotate away from seams
	mat2 rot = mat2(cos(.5), sin(.5), -sin(.5), cos(.5));
	dir.xz *= rot;
	dir.xy *= rot;

	// Reposition with regard to offset
	vec3 pos = vec3(offset * 0.01, offset, 0.);

	// Mouse offset
	vec2 mouse_offset = mouse * .00005;
	pos += vec3(mouse_offset.x, -mouse_offset.y, 0.);

	// Volumetric rendering
	float dist = .3; // Current layer distance
	float fade = .2; // Current layer fade
	vec3 color = vec3(0.);

	for (int r = 0; r < 13; r++) {
		vec3 p = pos + dist * dir;
		p = abs(vec3(PI) - mod(p, vec3(PI * 2.))); // Tiling fold

		float pa = 0.;
		float a = 0.;

		for (int i = 0; i < 20; i++) {
			p = abs(p) / dot(p, p) - .55; // the magic formula
			a += abs(length(p) - pa); // absolute sum of average change
			pa = length(p);
		}

		float dm = max(0., 1. - a * a * .001); // Dark matter
		if (r > 5) fade *= 1. - dm; // dark matter, don't render near

		a *= a * a; // add contrast
		color+=vec3(dist, dist * dist, dist * dist * dist * dist)
				* a * fade; // coloring based on distance

		fade *= .75; // distance fading
		dist += .2;
	}

	color *= 0.00002; // Brightness
	color = mix(vec3(length(color)), color, .8); // Color adjust

	// Fade the bottom pixels to background color
	float bottomFade = (gl_FragCoord.y / resolution.y) / .1;
	color = mix(vec3(.18, .20, .25), color, min(1., bottomFade));

	gl_FragColor = vec4(color, 1.);
}
