use NativeCall;
unit module tcod-console;

# our sub set_custom_font(Str, int32, int32, int32) is export
#     is symbol('TCOD_console_set_custom_font') is native('libtcod') { * }
#
# our sub new(int32, int32) is export
#     returns Pointer
#     is symbol('TCOD_console_new') is native('libtcod') { * }

class Console_Pointer is repr('CPointer') { * }
class Color is repr('CPointer') { * }
class TCOD_bkgnd_flag_t is repr('CPointer') { * }
class TCOD_alignment_t is repr('CPointer') { * }

class ConsoleHandle is repr('CPointer') {

    sub TCOD_console_new(int32 $width, int32 $height) returns ConsoleHandle   is native('libtcod') { * }
    sub TCOD_console_set_default_background(ConsoleHandle $con, uint32 $col)   is native('libtcod') { * }
    sub TCOD_console_set_default_foreground(ConsoleHandle $con, uint32 $col)   is native('libtcod') { * }
    sub TCOD_console_put_char(ConsoleHandle $con, int32 $x, int32 $y, int32 $c, TCOD_bkgnd_flag_t $flag)   is native('libtcod') { * }


    method new(int32 $width, int32 $height) {
        TCOD_console_new($width, $height);
    }

    method set_default_background(uint32 $color) {
        TCOD_console_set_default_background(self, $color);
    }
    method set_default_foreground(uint32 $color) {
        TCOD_console_set_default_foreground(self, $color);
    }

    method put_char(ConsoleHandle $con, int32 $x, int32 $y, int32 $c, TCOD_bkgnd_flag_t $flag) {
        TCOD_console_put_char(self, $x, $y, $c, $flag);
    }


    # ... and so on.
}


# void init_root(int w, int h, const char * title, bool fullscreen, TCOD_renderer_t renderer);
our sub init_root(int32 $w, int32 $h, Str $title, bool $fullscreen, uint32 $renderer) is export
    is symbol('TCOD_console_init_root') is native('libtcod') { * }

# void set_window_title(const char *title);
our sub set_window_title(Str $title) is export
    is symbol('TCOD_console_set_window_title') is native('libtcod') { * }

# void set_fullscreen(bool fullscreen);
our sub set_fullscreen(bool $fullscreen) is export
    is symbol('TCOD_console_set_fullscreen') { * }

# bool is_fullscreen(void);
our sub is_fullscreen() is export
    returns bool
    is symbol('TCOD_console_is_fullscreen') is native('libtcod') { * }

# bool is_window_closed(void);
our sub is_window_closed() is export
    returns bool
    is symbol('TCOD_console_is_window_closed') is native('libtcod') { * }

# bool has_mouse_focus(void);
our sub has_mouse_focus() is export
    returns bool
    is symbol('TCOD_console_has_mouse_focus') is native('libtcod') { * }

# bool is_active(void);
our sub is_active() is export
    returns bool
    is symbol('TCOD_console_is_active') is native('libtcod') { * }

# void set_custom_font(const char *fontFile, int flags,int nb_char_horiz, int nb_char_vertic);
our sub set_custom_font(Str $fontFile, int32 $flags, int32 $nb_char_horiz, int32 $nb_char_vertic) is export
    is symbol('TCOD_console_set_custom_font') is native('libtcod') { * }

# void map_ascii_code_to_font(int asciiCode, int fontCharX, int fontCharY);
our sub map_ascii_code_to_font(int32 $asciiCode, int32 $fontCharX, int32 $fontCharY) is export
    is symbol('TCOD_console_map_ascii_code_to_font') is native('libtcod') { * }

# void map_ascii_codes_to_font(int asciiCode, int nbCodes, int fontCharX, int fontCharY);
our sub map_ascii_codes_to_font(int32 $asciiCode, int32 $nbCodes, int32 $fontCharX, int32 $fontCharY) is export
    is symbol('TCOD_console_map_ascii_codes_to_font') is native('libtcod') { * }

# void map_string_to_font(const char *s, int fontCharX, int fontCharY);
our sub map_string_to_font(Str $s, int32 $fontCharX, int32 $fontCharY) is export
    is symbol('TCOD_console_map_string_to_font') is native('libtcod') { * }

# void set_dirty(int x, int y, int w, int h);
our sub set_dirty(int32 $x, int32 $y, int32 $w, int32 $h) is export
    is symbol('TCOD_console_set_dirty') is native('libtcod') { * }

# void set_default_background(Console_Pointer con,Color col);
our sub set_default_background(Console_Pointer $con, Color $col) is export
    is symbol('TCOD_console_set_default_background') is native('libtcod') { * }

# void set_default_foreground(Console_Pointer con,Color col);
our sub set_default_foreground(Console_Pointer $con, uint32 $col) is export
    is symbol('TCOD_console_set_default_foreground') is native('libtcod') { * }

# void clear(Console_Pointer con);
our sub clear(Console_Pointer $con) is export
    is symbol('TCOD_console_clear') is native('libtcod') { * }

# void set_char_background(Console_Pointer con,int x, int y, Color col, TCOD_bkgnd_flag_t flag);
our sub set_char_background(Console_Pointer $con, int32 $x, int32 $y, Color $col, TCOD_bkgnd_flag_t $flag) is export
    is symbol('TCOD_console_set_char_background') is native('libtcod') { * }

# void set_char_foreground(Console_Pointer con,int x, int y, Color col);
our sub set_char_foreground(Console_Pointer $con, int32 $x, int32 $y, Color $col) is export
    is symbol('TCOD_console_set_char_foreground') is native('libtcod') { * }

# void set_char(Console_Pointer con,int x, int y, int c);
our sub set_char(Console_Pointer $con, int32 $x, int32 $y, int32 $c) is export
    is symbol('TCOD_console_set_char') is native('libtcod') { * }

# void put_char(Console_Pointer con,int x, int y, int c, TCOD_bkgnd_flag_t flag);
our sub put_char(Console_Pointer $con, int32 $x, int32 $y, int32 $c, TCOD_bkgnd_flag_t $flag) is export
    is symbol('TCOD_console_put_char') is native('libtcod') { * }

# void put_char_ex(Console_Pointer con,int x, int y, int c, Color fore, Color back);
our sub put_char_ex(Console_Pointer $con, int32 $x, int32 $y, int32 $c, Color $fore, Color $back) is export
    is symbol('TCOD_console_put_char_ex') is native('libtcod') { * }

# void set_background_flag(Console_Pointer con,TCOD_bkgnd_flag_t flag);
our sub set_background_flag(Console_Pointer $con, TCOD_bkgnd_flag_t $flag) is export
    is symbol('TCOD_console_set_background_flag') is native('libtcod') { * }

# TCOD_bkgnd_flag_t get_background_flag(Console_Pointer con);
our sub get_background_flag(Console_Pointer $con) is export
    returns TCOD_bkgnd_flag_t
    is symbol('TCOD_console_get_background_flag') is native('libtcod') { * }

# void set_alignment(Console_Pointer con,TCOD_alignment_t alignment);
our sub set_alignment(Console_Pointer $con, TCOD_alignment_t $alignment) is export
    is symbol('TCOD_console_set_alignment') is native('libtcod') { * }

# TCOD_alignment_t get_alignment(Console_Pointer con);
our sub get_alignment(Console_Pointer $con) is export
    returns TCOD_alignment_t
    is symbol('TCOD_console_get_alignment') is native('libtcod') { * }

# # void print(Console_Pointer con, int x, int y, const char *fmt, ...);
# our sub print(Console_Pointer $con, int32 $x, int32 $y, Str $fmt, ...) is export
#     is symbol('TCOD_console_print') is native('libtcod') { * }

# # void print_ex(Console_Pointer con,int x, int y, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const char *fmt, ...);
# our sub print_ex(Console_Pointer $con, int32 $x, int32 $y, TCOD_bkgnd_flag_t $flag, TCOD_alignment_t $alignment, Str $fmt, ...) is export
#     is symbol('TCOD_console_print_ex') is native('libtcod') { * }

# # int print_rect(Console_Pointer con,int x, int y, int w, int h, const char *fmt, ...);
# our sub print_rect(Console_Pointer $con, int32 $x, int32 $y, int32 $w, int32 $h, Str $fmt, ...) is export
#     returns int32
#     is symbol('TCOD_console_print_rect') is native('libtcod') { * }

# # int print_rect_ex(Console_Pointer con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const char *fmt, ...);
# our sub print_rect_ex(Console_Pointer $con, int32 $x, int32 $y, int32 $w, int32 $h, TCOD_bkgnd_flag_t $flag, TCOD_alignment_t $alignment, Str $fmt, ...) is export
#     returns int32
#     is symbol('TCOD_console_print_rect_ex') is native('libtcod') { * }

# # int get_height_rect(Console_Pointer con,int x, int y, int w, int h, const char *fmt, ...);
# our sub get_height_rect(Console_Pointer $con, int32 $x, int32 $y, int32 $w, int32 $h, Str $fmt, ...) is export
#     returns int32
#     is symbol('TCOD_console_get_height_rect') is native('libtcod') { * }

# void rect(Console_Pointer con,int x, int y, int w, int h, bool clear, TCOD_bkgnd_flag_t flag);
our sub rect(Console_Pointer $con, int32 $x, int32 $y, int32 $w, int32 $h, bool $clear, TCOD_bkgnd_flag_t $flag) is export
    is symbol('TCOD_console_rect') is native('libtcod') { * }

# void hline(Console_Pointer con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
our sub hline(Console_Pointer $con, int32 $x, int32 $y, int32 $l, TCOD_bkgnd_flag_t $flag) is export
    is symbol('TCOD_console_hline') is native('libtcod') { * }

# void vline(Console_Pointer con,int x,int y, int l, TCOD_bkgnd_flag_t flag);
our sub vline(Console_Pointer $con, int32 $x, int32 $y, int32 $l, TCOD_bkgnd_flag_t $flag) is export
    is symbol('TCOD_console_vline') is native('libtcod') { * }

# # void print_frame(Console_Pointer con,int x,int y,int w,int h, bool empty, TCOD_bkgnd_flag_t flag, const char *fmt, ...);
# our sub print_frame(Console_Pointer $con, int32 $x, int32 $y, int32 $w, int32 $h, bool $empty, TCOD_bkgnd_flag_t $flag, Str $fmt, ...) is export
#     is symbol('TCOD_console_print_frame') is native('libtcod') { * }

# void map_string_to_font_utf(const wchar_t *s, int fontCharX, int fontCharY);
our sub map_string_to_font_utf(Str $s, int32 $fontCharX, int32 $fontCharY) is export
    is symbol('TCOD_console_map_string_to_font_utf') is native('libtcod') { * }

# # void print_utf(Console_Pointer con,int x, int y, const wchar_t *fmt, ...);
# our sub print_utf(Console_Pointer con,int x, int y, const wchar_t *fmt, ...) is export
#     is symbol('TCOD_console_print_utf') is native('libtcod') { * }

# # void print_ex_utf(Console_Pointer con,int x, int y, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const wchar_t *fmt, ...);
# our sub print_ex_utf(Console_Pointer $con, int32 $x, int32 $y, TCOD_bkgnd_flag_t $flag, TCOD_alignment_t $alignment, Str $fmt, ...) is export
#     is symbol('TCOD_console_print_ex_utf') is native('libtcod') { * }



#    is symbol('TCOD_console_') is native('libtcod') { * }


my $doc = q:to/EOD/;


int print_rect_utf(Console_Pointer con,int x, int y, int w, int h, const wchar_t *fmt, ...);
int print_rect_ex_utf(Console_Pointer con,int x, int y, int w, int h, TCOD_bkgnd_flag_t flag, TCOD_alignment_t alignment, const wchar_t *fmt, ...);
int get_height_rect_utf(Console_Pointer con,int x, int y, int w, int h, const wchar_t *fmt, ...);

Color get_default_background(Console_Pointer con);
Color get_default_foreground(Console_Pointer con);
Color get_char_background(Console_Pointer con,int x, int y);
Color get_char_foreground(Console_Pointer con,int x, int y);
int get_char(Console_Pointer con,int x, int y);

TCOD_image_t get_background_color_image(Console_Pointer con);
TCOD_image_t get_foreground_color_image(Console_Pointer con);

void set_fade(uint8 val, Color fade);
uint8 get_fade(void);
Color get_fading_color(void);

void flush(void);

void set_color_control(TCOD_colctrl_t con, Color fore, Color back);

TCOD_key_t check_for_keypress(int flags);
TCOD_key_t wait_for_keypress(bool flush);
bool is_key_pressed(TCOD_keycode_t key);

Console_Pointer from_file(const char *filename);
bool load_asc(Console_Pointer con, const char *filename);
bool load_apf(Console_Pointer con, const char *filename);
bool save_asc(Console_Pointer con, const char *filename);
bool save_apf(Console_Pointer con, const char *filename);

Console_Pointer new(int w, int h);
int get_width(Console_Pointer con);
int get_height(Console_Pointer con);
void set_key_color(Console_Pointer con,Color col);
void blit(Console_Pointer src,int xSrc, int ySrc, int wSrc, int hSrc, Console_Pointer dst, int xDst, int yDst, float foreground_alpha, float background_alpha);
void delete(Console_Pointer console);

void credits(void);
void credits_reset(void);
bool credits_render(int x, int y, bool alpha);
EOD
