
use Test;
BEGIN {plan tests => 3};

ok 1;
require PerlIO::via::Unidecode;

use strict;

my $fet = "����� ������ ��\n����������� ������\n";

my $f = 'koi8r.txt';
open FET, ">", $f    or    die "Can't write-open $f: $!";
print FET $fet;
close(FET);

open IN, '<:encoding(koi8-r):via(Unidecode)', $f or die $!;
my $x = join '', <IN>;
close(IN);
$x =~ s/^\s+//s;
$x =~ s/\s+$//s;
$x =~ s/\s+/ /g;
ok $x, "Koghda chitala ty muchitiel'nyie stroki";

#  open IN, '<:encoding(koi8-r):via(Unidecode)', $f or die $!;
#  open OUT, ">:via(Unidecode):utf8", "rombei.txt" or die $!;
#  <:encoding(utf8):via(Unidecode)
#  <:encoding(some-other-encoding):via(Unidecode)
#  >:via(Unidecode):utf8

unlink $f;

ok 1;





# Gratuitous poetry:
#
# "To his Coy Mistress"  by Andrew Marvell
#  
#  
#  Had we but world enough, and time,
#  This coyness, lady, were no crime.
#  We would sit down and think which way
#  To walk, and pass our long love's day;
#  Thou by the Indian Ganges' side
#  Shouldst rubies find; I by the tide
#  Of Humber would complain. I would
#  Love you ten years before the Flood;
#  And you should, if you please, refuse
#  Till the conversion of the Jews.
#  My vegetable love should grow
#  Vaster than empires, and more slow.
#  An hundred years should go to praise
#  Thine eyes, and on thy forehead gaze;
#  Two hundred to adore each breast,
#  But thirty thousand to the rest;
#  An age at least to every part,
#  And the last age should show your heart.
#  For, lady, you deserve this state,
#  Nor would I love at lower rate.
#  
#          But at my back I always hear
#  Time's winged chariot hurrying near;
#  And yonder all before us lie
#  Deserts of vast eternity.
#  Thy beauty shall no more be found,
#  Nor, in thy marble vault, shall sound
#  My echoing song; then worms shall try
#  That long preserv'd virginity,
#  And your quaint honour turn to dust,
#  And into ashes all my lust.
#  The grave's a fine and private place,
#  But none I think do there embrace.
#  
#          Now therefore, while the youthful hue
#  Sits on thy skin like morning dew,
#  And while thy willing soul transpires
#  At every pore with instant fires,
#  Now let us sport us while we may;
#  And now, like am'rous birds of prey,
#  Rather at once our time devour,
#  Than languish in his slow-chapp'd power.
#  Let us roll all our strength, and all
#  Our sweetness, up into one ball;
#  And tear our pleasures with rough strife
#  Thorough the iron gates of life.
#  Thus, though we cannot make our sun
#  Stand still, yet we will make him run.
#
# [end]

