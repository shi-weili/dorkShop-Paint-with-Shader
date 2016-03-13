#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {

    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    vec3 color = vec3(1.0, 1.0, 1.0);

    color = vec3(st.x, 0.0, 0.0);
    color = vec3(st.x, st.y, 0.0);
    color = vec3(st.x, st.y, abs(sin(u_time)));
    color += vec3(u_mouse.y / u_resolution.y);

    gl_FragColor = vec4(color,1.0);

}
