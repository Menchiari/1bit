function draw_text_ext_border(x, y, textz, sep, w, col, alpha, border_col, border_size)
{
    // full thick outline
    for (var bx = -border_size; bx <= border_size; bx++)
    for (var by = -border_size; by <= border_size; by++)
    {
        if (bx != 0 || by != 0) {
            draw_text_ext_color(
                x + bx, y + by,
                textz, sep, w,
                border_col, border_col, border_col, border_col,
                alpha
            );
        }
    }

    // main text on top
    draw_text_ext_color(x, y, textz, sep, w, col, col, col, col, alpha);
}
