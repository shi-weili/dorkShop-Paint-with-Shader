#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {

    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    float brightness = 0.0;

    float dist1 = distance(st, vec2(0.5, 0.5));
    float dist2 = distance(st, u_mouse/u_resolution);
    
    float distanceField = 1.0 / dist1;
    distanceField = 1.0 / dist1 + 1.0 / dist2;
    
    brightness = smoothstep(0.0, 10.0, distanceField);
    brightness = smoothstep(9.0, 10.0, distanceField);
    brightness = step(10.0, distanceField);
    
    gl_FragColor = vec4(brightness, 0.0, 0.0 ,1.0);

}
