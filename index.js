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

    },

    count: 4,
    primitive: 'triangle fan'
})


regl.frame((context)=>{
    // console.log(context);
    // console.log(context.time);
    drawBG();
})

