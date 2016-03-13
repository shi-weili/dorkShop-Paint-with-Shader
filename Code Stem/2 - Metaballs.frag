#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {

    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    
    float brightness = 0.0;
    
    
    
    gl_FragColor = vec4(brightness, 0.0, 0.0 ,1.0);

}
