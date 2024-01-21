shader_type spatial;

uniform vec4 albedo : source_color;
uniform sampler2D albedo_texture :
	source_color,filter_linear_mipmap,repeat_enable;

uniform vec2 tiling = vec2(1.0);
uniform vec2 offset;

void vertex() {
	UV = UV * tiling + offset*TIME;
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 albedo_tex = texture(albedo_texture, UV);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	ALPHA *= albedo.a * albedo_tex.a;
	//ALPHA *= texture(mask, UV).r;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
