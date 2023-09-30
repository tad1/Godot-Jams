shader_type spatial;

void fragment() {
	// Place fragment code here.
	ALBEDO.r = sin(UV.r);
	ALBEDO.g = cos(UV.r);
	ALBEDO.b = 0.1;

}
