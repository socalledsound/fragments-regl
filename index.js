const regl = require('regl')();
const glslify = require('glslify');

const drawBG = regl({
    frag: glslify('./frag.glsl'),
    vert: glslify('./vert.glsl'),

    attributes: {
        position: [[-1, -1], [1, -1], [1,1], [-1, 1]]
    },

    uniforms: {
        u_color1: [0.0, 1.0, 0.0, 1.0],
        u_color2: [0.0, 0.0, 1.0, 1.0],
        u_time: (context) => context.time,
        u_resolution: (context) => [context.viewportWidth, context.viewportHeight],
        u_Frequency: 2.0,
        u_NoiseScale : 6.0,
        u_RingScale: 0.6,
        u_Contrast: 4.0,
    },

    count: 4,
    primitive: 'triangle fan'
})

regl.frame((context)=>{
    // console.log(context);
    // console.log(context.time);
    drawBG();
})

