shader_type canvas_item;

uniform vec4 color_dark : source_color = vec4(0.5, 0.0, 0.0, 1.0);
uniform vec4 color_bright : source_color = vec4(1.0, 0.5, 0.0, 1.0);
uniform float speed : hint_range(0.0, 2.0) = 0.5;
uniform float scale : hint_range(1.0, 10.0) = 3.0;
uniform vec2 flow_direction = vec2(1.0, 0.2);
uniform float brightness : hint_range(0.0, 1.0) = 0.5;
uniform float contrast : hint_range(0.0, 2.0) = 1.0;

float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

float noise(vec2 st) {
    vec2 i = floor(st);
    vec2 f = fract(st);

    float a = random(i);
    float b = random(i + vec2(1.0, 0.0));
    float c = random(i + vec2(0.0, 1.0));
    float d = random(i + vec2(1.0, 1.0));

    vec2 u = f * f * (3.0 - 2.0 * f);

    return mix(a, b, u.x) + (c - a)* u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

float fbm(vec2 st) {
    float value = 0.0;
    float amplitude = 0.5;
    float frequency = 0.;
    for (int i = 0; i < 5; i++) {
        value += amplitude * noise(st);
        st *= 2.0;
        amplitude *= 0.5;
    }
    return value;
}

void fragment() {
    vec2 st = UV * scale;

    vec2 flow = flow_direction * TIME * speed;
    float n = fbm(st + flow);
    n += 0.5 * fbm((st + flow) * 0.4);

    // Apply contrast and brightness adjustments
    n = (n - 0.5) * contrast + 0.5 + brightness - 0.5;
    n = clamp(n, 0.0, 1.0);

    vec4 lava_color = mix(color_dark, color_bright, n);

    float glow = smoothstep(0.6, 0.9, n);
    lava_color += glow * 0.3;

    COLOR = lava_color;
}