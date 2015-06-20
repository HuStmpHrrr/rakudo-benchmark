#!/usr/bin/env perl6
use Bench;

sub largest-prime-factor($n is copy) {
	for 2, 3, *+2 ... * {
		while $n %% $_ {
			$n div= $_;
			return $_ if $_ > $n;
		}
	}
}

my $b = Bench.new;
$b.timethis(1, sub { largest-prime-factor(600_851_475_143) }, :title('prime factor'));
