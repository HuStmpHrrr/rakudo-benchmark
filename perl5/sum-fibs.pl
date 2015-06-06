#!/usr/bin/env perl
use strict;
use warnings;
use Benchmark qw(timethis);
use List::Util qw(reduce);

sub sum_fibs {
	my @arr = (1, 1);
	my $i = 0;
	while(1) {
		my $res = $arr[$i] + $arr[$i+1];
		last if $res > 4000000;
		push @arr, $res;
		$i++;
	}
	return reduce { $a+$b } grep { $_ % 2 == 0 } @arr;
}


my @begin = times;
sum_fibs for (0..100000);
my @end = times;

my @differences = map { $end[$_] - $begin[$_] } (0..$#begin);

print "sum fibs: $differences[0] seconds / 100000\n";

