shader_type spatial;
render_mode alpha_to_coverage;

uniform sampler2D six_tex;//图片
uniform float size = 1;//波纹大小
uniform vec3 color;
uniform sampler2D depth:hint_depth_texture;//深度贴图
uniform float murk;


void vertex() {
	vec3 k = texture(six_tex,UV).rgb;//获取图片
	vec3 news = k*vec3(size)*NORMAL+VERTEX;//根据获取图片信息升起水花
	VERTEX = news;//应用
}

void fragment() {
	vec3 cl = texture(six_tex,UV).rgb;//获取图片
	float d = texture(depth, SCREEN_UV).r;
	d = PROJECTION_MATRIX[3][2] / (d + PROJECTION_MATRIX[2][2]);
	d = d + VERTEX.z;
	
	ALBEDO = vec3(exp(-d * murk));
}


