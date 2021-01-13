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


vec3 rotate(vec3 pt, float theta){
  float c = cos(theta);
  float s = sin(theta);
  float aspect = 2.0/1.5;
  mat3 mat = mat3(c, s, 1, 
                  -s,c, 1, 
                  s, c, 1);
 
  pt = mat * pt;
  
  return pt;
}



void main(){
    vec3 st = vec3(uv, 0.0);

    vec3 rotPoints = rotate(st, u_time * 0.3);

    float n = snoise3(rotPoints);
    // float n = 0.01;
    float ring = fract( u_Frequency * uv.x  + u_NoiseScale * n * sin(u_time * 0.05) * 2.0 );
    ring *= u_Contrast * ( 1.0 - ring ) ;
    float lerp = pow( ring, u_RingScale ) + n ;
    vec4 color = mix(u_color1, u_color2, lerp );
    gl_FragColor = color;
}