shader_type canvas_item;

uniform sampler2D noise1 : repeat_enable;
uniform sampler2D noise2 : repeat_enable;

uniform sampler2D screen_texture: hint_screen_texture;
uniform vec4 tone_color : source_color;

uniform vec2 scroll1 = vec2(0.05, 0.05);
uniform vec2 scroll2 = vec2(-0.05, -0.05);
uniform float distortion_strenght = 0.2;

uniform vec4 top_color: source_color;
uniform float light_start : hint_range(0.0, 1.0, 0.001) = 0.275;
uniform float light_end : hint_range(0.0, 1.0, 0.01) = 0.4;


void fragment() {
	// Called for every pixel the material is visible on.
	float depth = texture (noise1, UV + scroll1 * TIME).r * texture(noise2, UV + scroll2 * TIME).r;
	vec4 screen_col = texture(screen_texture, SCREEN_UV + distortion_strenght * vec2(depth));
	vec4 top_light = smoothstep(light_start, light_end, depth) * top_color;
	COLOR = screen_col * tone_color + top_light;
	COLOR.a = 1.0;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
