#!/usr/bin/awk -f

function init_iter() {
	current = 2;
	nnum = 3;
}

function iter() {
	ret = current;
	current = nnum;
	nnum += 2;
	return ret;
}

function lpf(n) {
	init_iter();
	while (1) {
		i = iter();
		while (n % i == 0) {
			n /= i;
			if (i > n) return i;
		}
	}
}

BEGIN {
    begin = systime();
    for (j = 0; j < 5000; j++)
        lpf(600851475143);
    end = systime();
    print "prime factor:", end - begin, "seconds", "/", 5000
}
