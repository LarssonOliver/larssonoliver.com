precision highp float;
uniform sampler2D source;
varying vec2 vUV;
void main() {
	gl_FragColor = texture2D(source, vUV);
}
