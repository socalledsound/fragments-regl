precision mediump float;

uniform vec4 u_color1;
uniform vec4 u_color2;
uniform float u_time;
uniform vec2 u_resolution;
varying vec2 uv;


// float circle(in vec2 _st, in float _radius){
//     vec2 dist = _st-vec2(0.0);
// 	return 1.-smoothstep(_radius-(_radius*0.01),
//                          _radius+(_radius*0.01),
//                         //  dot(dist,dist)*4.0);
//                         // dot(dist, dist) * 4.0);
//                         dot(_st, _st) * 4.0);
// }


void main(){
    vec2 center = vec2(0.5);
    vec2 pos = uv;

    pos *= 3.0;
    pos = fract(pos);
    pos -= center;

    float inCircle = 1.0 - step(0.5, length(pos));
    vec4 color = mix(u_color1, u_color2, inCircle);
    gl_FragColor = vec4(color);
  
  
}
