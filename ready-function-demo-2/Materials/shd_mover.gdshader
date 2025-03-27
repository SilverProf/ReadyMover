shader_type canvas_item;

uniform vec3 color = vec3(1.0);
uniform float alpha = 1.0;

vec3 grayscale(vec3 base) {
	float gray = (base.x + base.y + base.z) / 3.0;
	return vec3(gray);
}

void fragment() {
	COLOR = vec4(grayscale(COLOR.xyz) * color, alpha);
}