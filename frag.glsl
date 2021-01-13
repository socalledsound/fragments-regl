precision mediump float;

uniform vec4 u_color1;
uniform vec4 u_color2;
uniform float u_time;
uniform vec2 u_resolution;
varying vec2 uv;


float circle(in vec2 _st, in float _radius){
    vec2 dist = _st-vec2(0.0);
	return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                        //  dot(dist,dist)*4.0);
                        // dot(dist, dist) * 4.0);
                        dot(_st, _st) * 4.0);
}


void main(){

    //vec2 center = vec2(0.5);
    // vec2 pos.x = uv.x/u_resolution.x;
    // pos.x *= u_resolution.x/u_resolution.y;
    // vec2 pos = uv * 2.0 - 1.0;

    // vec2 st = fract(pos * 2.0);
    // vec3 color = vec3(circle(abs(st), 0.4));
    // gl_FragColor = vec4(color, 1.0);





    // float inCircle = 1.0 - step(0.5, fract(length(uv) * 12.0));
    vec2 center = vec2(0.5);
    vec2 pos = uv;

    pos *= 3.0;
    pos = fract(pos);
    pos -= center;

    float inCircle = 1.0 - step(0.5, length(pos));
    vec4 color = mix(u_color1, u_color2, inCircle);
    gl_FragColor = vec4(color);
  
  
  
    // vec2 st =  uv/u_resolution;
    // st.x = uv.x / u_resolution.x/u_resolution.y;
    // float d = 0.0;
    // st = st * 2.0 - 1.0;
    // d = length(abs(st) - 3.0);
    // gl_FragColor = vec4(vec3(fract(d* 10.0)), 1.0);


    // vec2 pos = st * center;
    // vec3 color = vec3(circle(abs(fract(pos * 10.0)), 0.5));

    // vec4 color = mix(u_color1, u_color2, (sin(u_time * uv.x/uv.y * 100.0) + 1.0)/2.0);
    
    // gl_FragColor = vec4(color, 1.0);

  
}

// #ifdef GL_ES
// precision mediump float;
// #endif

// uniform vec2 u_resolution;
// uniform vec2 u_mouse;
// uniform float u_time;

// void main(){
//   vec2 st = gl_FragCoord.xy/u_resolution.xy;
//   st.x *= u_resolution.x/u_resolution.y;
//   vec3 color = vec3(0.0);
//   float d = 0.0;

//   // Remap the space to -1. to 1.
//   st = st *2.-1.;

//   // Make the distance field
//   d = length( abs(st)-.3 );
//   // d = length( min(abs(st)-.3,0.) );
//   // d = length( max(abs(st)-.3,0.) );

//   // Visualize the distance field
//   gl_FragColor = vec4(vec3(fract(d*10.0)),1.0);

//   // Drawing with the distance field
//   // gl_FragColor = vec4(vec3( step(.3,d) ),1.0);
//   // gl_FragColor = vec4(vec3( step(.3,d) * step(d,.4)),1.0);
//   // gl_FragColor = vec4(vec3( smoothstep(.3,.4,d)* smoothstep(.6,.5,d)) ,1.0);
// }


//       vec2 st = uv.xy/u_resolution.xy;
    
//       st.x *= u_resolution.x/u_resolution.y;
//       vec3 color = vec3(0.0);
//       float d = 0.0;
//       d = length( abs(st)-.3 );
//       d = length( min(abs(st)-.3,0.) );
//     //   d = length( max(abs(st)-.3,0.) );
//   // Visualize the distance field
//   gl_FragColor = vec4(vec3(fract(d * 10.0)),1.0);