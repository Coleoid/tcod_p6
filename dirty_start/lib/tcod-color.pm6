use NativeCall;

unit module tcod-color;


class Color is repr('CStruct') {
    has uint8 $!r;
    has uint8 $!g;
    has uint8 $!b;

    method set(uint8 $r, uint8 $g, uint8 $b) {
        $!r = $r;
        $!g = $g;
        $!b = $b;

        say "r $!r, g $!g, b $!b";
    }
}

class Colorist {

# constructors
    sub TCOD_color_RGB(uint8 $r, uint8 $g, uint8 $b) returns Pointer  is native('libtcod') { * }
    sub TCOD_color_HSV(num32 $h, num32 $s, num32 $v) returns Color  is native('libtcod') { * }

# basic operations
    sub TCOD_color_equals(Color $c1, Color $c2) returns bool  is native('libtcod') { * }
    sub TCOD_color_add(Color $c1, Color $c2) returns Color  is native('libtcod') { * }
    sub TCOD_color_subtract(Color $c1, Color $c2) returns Color  is native('libtcod') { * }
    sub TCOD_color_multiply(Color $c1, Color $c2) returns Color  is native('libtcod') { * }
    sub TCOD_color_multiply_scalar (Color $c1, num32 $value) returns Color  is native('libtcod') { * }
    sub TCOD_color_lerp(Color $c1, Color $c2, num32 $coef) returns Color  is native('libtcod') { * }

# HSV transformations
    sub TCOD_color_set_HSV(Color $c is rw, num32 $h, num32 $s, num32 $v)   is native('libtcod') { * }
    sub TCOD_color_get_HSV(Color $c, num32 $h is rw, num32 $s is rw, num32 $v is rw)   is native('libtcod') { * }
    sub TCOD_color_get_hue(Color $c) returns num32  is native('libtcod') { * }
    sub TCOD_color_set_hue(Color $c is rw, num32 $h)   is native('libtcod') { * }
    sub TCOD_color_get_saturation(Color $c) returns num32  is native('libtcod') { * }
    sub TCOD_color_set_saturation(Color $c is rw, num32 $s)   is native('libtcod') { * }
    sub TCOD_color_get_value(Color $c) returns num32  is native('libtcod') { * }
    sub TCOD_color_set_value(Color $c is rw, num32 $v)   is native('libtcod') { * }
    sub TCOD_color_shift_hue(Color $c is rw, num32 $hshift)   is native('libtcod') { * }
    sub TCOD_color_scale_HSV(Color $c is rw, num32 $scoef, num32 $vcoef)   is native('libtcod') { * }

# color map
#    sub TCOD_color_gen_map(Color *map, int nb_key, Color const *key_color, int32 const *key_index)   is native('libtcod') { * }


# constructors

    method RGB(uint8 $r, uint8 $g, uint8 $b) returns Color {
        say "RGB got $r, $g, $b.";
        my $c = TCOD_color_RGB($r, $g, $b);
        say "RGB created $c.";
        $c
    }

    method HSV(num32 $h, num32 $s, num32 $v) returns Color {
        return TCOD_color_HSV($h, $s, $v);
    }


# basic operations
    method equals(Color $c1, Color $c2) returns bool {
        return TCOD_color_equals($c1, $c2);
    }

    method add(Color $c1, Color $c2) returns Color {
        return TCOD_color_add($c1, $c2);
    }

    method subtract(Color $c1, Color $c2) returns Color {
        return TCOD_color_subtract($c1, $c2);
    }

    method multiply(Color $c1, Color $c2) returns Color {
        return TCOD_color_multiply($c1, $c2);
    }

    method multiply_scalar(Color $c1, num32 $value) returns Color {
        return TCOD_color_multiply_scalar($c1, $value);
    }

    method lerp(Color $c1, Color $c2, num32 $coef) returns Color {
        return TCOD_color_lerp($c1, $c2, $coef);
    }

# HSV transformations
    method set_HSV(Color $c is rw, num32 $h, num32 $s, num32 $v) {
        TCOD_color_set_HSV($c, $h, $s, $v)
    }

    method get_HSV(Color $c, num32 $h is rw, num32 $s is rw, num32 $v is rw) {
        return TCOD_color_get_HSV($c, $h, $s, $v);
    }

    method get_hue(Color $c) returns num32 {
        return TCOD_color_get_hue($c);
    }

    method set_hue(Color $c is rw, num32 $h)  {
        TCOD_color_set_hue($c, $h);
    }

    method get_saturation(Color $c) returns num32 {
        return TCOD_color_get_saturation($c);
    }

    method set_saturation(Color $c is rw, num32 $s)  {
        TCOD_color_set_saturation($c, $s);
    }

    method get_value(Color $c) returns num32 {
        return TCOD_color_get_value($c);
    }

    method set_value(Color $c is rw, num32 $v)  {
        TCOD_color_set_value($c, $v);
    }

    method shift_hue(Color $c is rw, num32 $hshift)  {
        TCOD_color_shift_hue($c, $hshift);
    }

    method scale_HSV(Color $c is rw, num32 $scoef, num32 $vcoef)  {
        TCOD_color_scale_HSV($c, $scoef, $vcoef);
    }


# color map
#    method gen_map(Color $map is rw, int32 $nb_key, Color $key_color is ro, int $key_index is ro) {
#        TCOD_color_gen_map($map, $nb_key, $key_color, $key_index);
#    }

}
