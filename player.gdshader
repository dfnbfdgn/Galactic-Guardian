shader_type canvas_item;
uniform bool metal = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 input_color = texture(TEXTURE, UV);
	float color_average = (input_color.r + input_color.g + input_color.b) / 7.0;
	if (metal) {
		COLOR = vec4(color_average , color_average, color_average, input_color.a);
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
