use NativeCall;
unit module tcod-console;

our sub init_root(int32, int32, Str, bool, uint32) is export
    is symbol('TCOD_console_init_root') is native('libtcod') { * }

our sub set_custom_font(Str, int32, int32, int32) is export
    is symbol('TCOD_console_set_custom_font') is native('libtcod') { * }

our sub new(int32, int32) is export
    returns Pointer
    is symbol('TCOD_console_new') is native('libtcod') { * }

our sub is_window_closed() is export
    returns bool
    is symbol('TCOD_console_is_window_closed') is native('libtcod') { * }
