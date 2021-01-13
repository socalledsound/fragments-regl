precision mediump float;

uniform vec4 u_color1;
uniform vec4 u_color2;
uniform float u_Frequency;
uniform float u_NoiseScale;
uniform float u_RingScale;
uniform float u_Contrast;
uniform float u_time;
varying vec2 uv;

void main(){
    float n = 0.3;
    float ring = fract( u_Frequency * uv.x + u_NoiseScale * n );
    ring *= u_Contrast * ( 1.0 - ring );
    float lerp = pow( ring, u_RingScale ) + n;
    vec4 color = mix(u_color1, u_color2, lerp);
    // vec4 color = mix(u_color1, u_color2, (sin(u_time * uv.x/uv.y * 100.0) + 1.0)/2.0);
    
    gl_FragColor = color;
}