precision mediump float;

uniform vec4 u_color1;
uniform vec4 u_color2;
uniform float u_Frequency;
uniform float u_NoiseScale;
uniform float u_RingScale;
uniform float u_Contrast;
uniform float u_time;
varying vec2 uv;

#pragma glslify: snoise3 = require(glsl-noise/simplex/3d)

void main(){
    vec3 st = vec3(uv, 0.0);

    float n = snoise3(st);
    // float n = 0.01;
    float ring = fract( u_Frequency * uv.x  + u_NoiseScale * n * sin(u_time * 0.5) * 2.0 );
    ring *= u_Contrast * ( 1.0 - ring ) ;
    float lerp = pow( ring, u_RingScale ) + n ;
    vec4 color = mix(u_color1, u_color2, lerp );
    gl_FragColor = color;
}