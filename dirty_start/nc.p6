use tcod-console;


tcod-console::set_custom_font('arial10x10.png', 12, 0, 0);
tcod-console::init_root(80, 50, 'libtcod in 6lang', False, 2);
my $console = tcod-console::new(80, 50);

#  Main loop
while !tcod-console::is_window_closed() {
    tcod-console::set_default_foreground(0, tcod::white);
    tcod-console::put_char(0, 30, 20, '@', tcod::BKGND_NONE);
    tcod-console::flush();

    my $key = tcod-console::wait_for_keypress(True);

}
