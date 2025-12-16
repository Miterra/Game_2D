shader_type canvas_item;

uniform sampler2D my_tex;
uniform float radius : hint_range(0.0, 10.0) = 0.0;

void fragment() {
    vec2 pixel_size = 1.0 / vec2(textureSize(my_tex, 0));
    vec4 col = vec4(0.0);
    float count = 0.0;

    for (float x = -radius; x <= radius; x++) {
        for (float y = -radius; y <= radius; y++) {
            col += texture(my_tex, UV + vec2(x, y) * pixel_size);
            count++;
        }
    }

    COLOR = col / count;
}
