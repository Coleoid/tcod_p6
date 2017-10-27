use tcod-console;

tcod-console::set_custom_font('arial10x10.png', 12, 0, 0);
tcod-console::init_root(80, 50, 'libtcod in 6lang', False, 2);

my $con = tcod-console::ConsoleHandle.new(80, 50);
say "ConsoleHandle: $con";

#  Main loop
#while !tcod-console::is_window_closed() {

    $con.set_default_foreground(0xffffffff);
    say "set fore";

    $con.put_char(30, 20, '@', 0x0);
    say "@";

    tcod-console::flush();
    say "flushed";

    my $key = tcod-console::wait_for_keypress(True);
    say "waited";

#}

say "Done.";
