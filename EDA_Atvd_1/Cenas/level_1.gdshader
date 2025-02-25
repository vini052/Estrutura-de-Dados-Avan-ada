shader_type canvas_item;

uniform float blackout : hint_range(0.0, 1.0);

void fragment() {
    vec4 color_black = vec4(0.0, 0.0, 0.0, blackout);
    COLOR = color_black;
}