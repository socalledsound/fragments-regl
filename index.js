const regl = require('regl')();
const glslify = require('glslify');

const drawBG = regl({
    frag: glslify('./frag.glsl'),
    vert: glslify('./vert.glsl'),

    attributes: {
        position: [[-1, -1], [1, -1], [1,1], [-1, 1]]
    },

    uniforms: {
        u_color1: (context) => [Math.cos(context.time/100), Math.sin(context.time/10) * 2.0 - 1.0, 0.0, 1.0],
        u_color2: [0.0, 0.0, 1.0, 1.0],
        u_time: (context) => context.time,
        u_Frequency: 2.0,
        u_NoiseScale : 12.0,
        u_RingScale: (context) => Math.sin(context.time/10),
        u_Contrast: 2.0,
    },

    count: 4,
    primitive: 'triangle fan'
})

regl.frame((context)=>{
    // console.log(context);
    // console.log(context.time);
    drawBG();
})

