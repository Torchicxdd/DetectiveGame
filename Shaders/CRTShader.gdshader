shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_linear;
uniform float scanline_strength : hint_range(0.0, 1.0) = 0.3;
uniform float scanline_count : hint_range(100.0, 1000.0) = 300.0;
uniform float curvature : hint_range(0.0, 10.0) = 2.0;
uniform float vignette_strength : hint_range(0.0, 1.0) = 0.3;
uniform float brightness : hint_range(0.5, 1.5) = 1.0;
uniform vec3 tint : source_color = vec3(1.0, 1.0, 1.0);
uniform float noise_amount : hint_range(0.0, 0.5) = 0.02;
uniform float scanline_speed : hint_range(-2.0, 2.0) = 0.1;

// Random function for noise
float random(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

// Apply barrel distortion for curved screen effect
vec2 curve_uv(vec2 uv) {
    uv = uv * 2.0 - 1.0;
    vec2 offset = abs(uv.yx) / vec2(curvature, curvature);
    uv = uv + uv * offset * offset;
    uv = uv * 0.5 + 0.5;
    return uv;
}

void fragment() {
    // Use UV instead of SCREEN_UV for SubViewportContainer
    vec2 uv = UV;
    
    // Apply curvature
    vec2 curved_uv = curve_uv(uv);
    
    // Check if we're outside the curved bounds (black borders)
    if (curved_uv.x < 0.0 || curved_uv.x > 1.0 || curved_uv.y < 0.0 || curved_uv.y > 1.0) {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0);
    } else {
        // Sample the texture of the control itself
        vec3 col = texture(TEXTURE, curved_uv).rgb;
        
        // Scanlines with movement
        float scanline_offset = TIME * scanline_speed;
        float scanline = sin((curved_uv.y + scanline_offset) * scanline_count * 3.14159) * 0.5 + 0.5;
        scanline = mix(1.0, scanline, scanline_strength);
        col *= scanline;
        
        // Add some subtle noise for authenticity
        float noise = random(curved_uv + vec2(TIME * 0.1)) * noise_amount;
        col += vec3(noise);
        
        // Vignette effect
        vec2 vignetteUV = curved_uv * (1.0 - curved_uv);
        float vignette = vignetteUV.x * vignetteUV.y * 15.0;
        vignette = pow(vignette, vignette_strength);
        col *= vignette;
        
        // Apply tint and brightness
        col *= tint * brightness;
        
        COLOR = vec4(col, 1.0);
    }
}