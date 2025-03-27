shader_type canvas_item;

uniform vec3 color = vec3(1.0);
uniform float innerRadius = .38;
uniform float outerRadius = .45;

float distFromCenter(vec2 uv) {
	float a = abs(uv.x - .5);
	float b = abs(uv.y - .5);
	
	return sqrt((a * a) + (b * b));
}

bool inRing(vec2 uv) {
	return distFromCenter(uv) >= innerRadius && distFromCenter(uv) <= outerRadius;
}

void fragment() {
	COLOR = vec4(color, (inRing(UV)) ? 1.0 : 0.0);
}