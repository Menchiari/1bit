varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 fragCoord;

uniform vec2 iResolution;
uniform float iGlobalTime;
uniform int palette;
uniform float gamma;
uniform float flicker;

void main()
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    vec3 c = vec3(0.0);
    float alpha = 1.0;
    
    c = texture2D(gm_BaseTexture,uv).rgb;
    
    c.r = pow(abs(c.r),gamma);
    c.g = pow(abs(c.g),gamma);
    c.b = pow(abs(c.b),gamma);
    
    vec3 col1 = vec3(0.0);
    vec3 col2 = vec3(0.0);
    vec3 col3 = vec3(0.0);
    vec3 col4 = vec3(0.0);
    
	if(palette == 0) {
       col1 = vec3(0);
       col2 = vec3(0);
       col3 = vec3(1);
       col4 = vec3(1);
	}
	
    float dist1 = length(c - col1);
    float dist2 = length(c - col2);
    float dist3 = length(c - col3);
    float dist4 = length(c - col4);

    float d = min(dist1,dist2);
    d = min(d,dist3);
    d = min(d,dist4);

    if(d == dist1) {
        c = col1;
    }
    else if(d == dist2) {
        c = col2;
    }
    else if(d == dist3) {
        c = col3;
    }
    else {
        c = col4;
    }
    
	c = c+flicker;
    gl_FragColor = vec4(c,alpha).rgba;
}