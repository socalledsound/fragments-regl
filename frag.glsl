precision mediump float;

uniform vec4 u_color1;
uniform vec4 u_color2;
varying vec2 uv;

void main(){

    vec4 color = mix(u_color1, u_color2, (uv.x/uv.y + 1.0)/2.0);
    gl_FragColor = color;
}