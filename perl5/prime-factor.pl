#!/usr/bin/env perl
use strict;
use warnings;
use List::Util qw(reduce);

sub init_candidates { (2, 3) }
sub next_candidates { ($_[1], $_[1] + 2) }

sub lpf {
	my $n = shift;
	my @iter = init_candidates;
	while (1) {
		my $i = $iter[1];
		while ($n % $i == 0) {
			$n /= $i;
			return $i if $i > $n;
		}
		@iter = next_candidates @iter;
	}
}

my @begin = times;
lpf 600851475143 for (0..1000);
my @end = times;

my @differences = map { $end[$_] - $begin[$_] } (0..$#begin);

print "sum fibs: $differences[0] seconds / 1000\n";

