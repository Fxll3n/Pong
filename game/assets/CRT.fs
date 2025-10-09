extern number time;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
{
    // Create a moving rainbow gradient based on screen position and time
    float speed = 0.5;
    float x = screen_coords.x / love_ScreenSize.x;
    float y = screen_coords.y / love_ScreenSize.y;
    float t = time * speed;

    // Calculate hue based on position and time
    float hue = mod(x + y + t, 1.0);

    // Convert hue to RGB
    float r = abs(hue * 6.0 - 3.0) - 1.0;
    float g = 2.0 - abs(hue * 6.0 - 2.0);
    float b = 2.0 - abs(hue * 6.0 - 4.0);

    r = clamp(r, 0.0, 1.0);
    g = clamp(g, 0.0, 1.0);
    b = clamp(b, 0.0, 1.0);

    vec4 rainbow = vec4(r, g, b, 1.0);

    // Multiply with texture color
    return rainbow * Texel(texture, texture_coords) * color;
}