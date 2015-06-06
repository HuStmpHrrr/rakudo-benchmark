#!/usr/bin/env perl6

use Bench;

my $b = Bench.new;

$b.timethis(100, sub {[+] grep * %% 2, (1, 2, *+* ...^ * > 4_000_000)}, :title('sum fibs'));

