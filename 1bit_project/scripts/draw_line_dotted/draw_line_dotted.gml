/// draw_line_dotted(dx1, dy1, dx2, dy2, stepx, colorx, start_frac, max_len)
function draw_line_dotted(dx1, dy1, dx2, dy2, stepx, colorx, start_frac, max_len)
{
    var sx = dx1, sy = dy1, tx = dx2, ty = dy2;
    var step = stepx;

    // Optional max length clamp (pixels)
    if (argument_count >= 8 && max_len > 0) {
        var vx = tx - sx;
        var vy = ty - sy;
        var dist = sqrt(vx*vx + vy*vy);
        if (dist > max_len) {
            var s = max_len / dist;
            tx = sx + vx * s;
            ty = sy + vy * s;
        }
    }

    var xr = abs(tx - sx);
    var yr = abs(ty - sy);
    var l  = (xr > yr) ? xr : yr;
    if (l <= 0) return;

    var px = (sx << 12) + (1 << 11);
    var py = (sy << 12) + (1 << 11);
    var ex = (tx << 12) + (1 << 11);
    var ey = (ty << 12) + (1 << 11);

    var dx = (ex - px) / l;
    var dy = (ey - py) / l;

    var start_index = clamp(floor(l * start_frac), 0, l);

    if (step < 1) {
        for (var i = 0; i <= l; i++) {
            if (i >= start_index) draw_point_color(px >> 12, py >> 12, colorx);
            px += dx; py += dy;
        }
    } else {
        var cnt = 0;
        for (var i = 0; i <= l; i++) {
            if (i >= start_index) {
                var posx = px >> 12;
                var posy = py >> 12;
                if (cnt < step) draw_point_color(posx, posy, colorx);
            }
            cnt = (cnt + 1) mod (step * 2);
            px += dx; py += dy;
        }
    }
}
