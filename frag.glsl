precision mediump float;

uniform vec4 u_color1;
uniform vec4 u_color2;

uniform float u_time;
varying vec2 uv;

void main(){
    vec4 color = mix(u_color1, u_color2, (sin(u_time * uv.x/uv.y * 100.0) + 1.0)/2.0);
    gl_FragColor = color;
}