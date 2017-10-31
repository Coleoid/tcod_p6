use tcod-console;
use tcod-color;

tcod-console::set_custom_font('arial10x10.png', 12, 0, 0);
tcod-console::init_root(80, 50, 'libtcod in 6lang', False, 2);

my $con = tcod-console::ConsoleHandle.new(80, 50);
say "ConsoleHandle: $con";

my $col = tcod-color::Colorist.new();
say "made colorist: $col";


my uint8 $r = 255;
my uint8 $g = 255;
my uint8 $b = 255;
say "made r: $r";

#my $white = $col.RGB($r,$r,$r);
my $white = tcod-color::Color.new();
my $black = tcod-color::Color.new();
$white.set($r, $g, $b);
$black.set(0,0,0);
say "made white: $white";

#my $x = prompt "Press enter... ";


#  Main loop
#while !tcod-console::is_window_closed() {

    $con.set_default_foreground($white);
    $con.set_default_background($black);
    say "set foreground/background";

    $con.put_char(30, 20, '@', 0x01);
    say "@";
    prompt "enter";

    tcod-console::flush();
    say "flushed";
    prompt "enter";

    $con.put_char(30, 20, '@', 0x03);
    say "@";
    prompt "enter";

    my $key = tcod-console::wait_for_keypress(True);
    say "waited";

#}

say "Done.";
