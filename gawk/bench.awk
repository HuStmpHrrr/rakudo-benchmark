#!/usr/bin/awk -f

function sum_fibs() {
    arr[0] = 1;
    arr[1] = 2;
    i = 0;
    while (1) {
        n = arr[i] + arr[i+1];
        if (n > 4000000) break;
        arr[i+2] = n;
        i++;
    }

    sum = 0;
    for (e in arr) {
        if (arr[e] % 2 == 0)
            sum += arr[e];
    }
    return sum;
}

BEGIN {
    begin = systime();
    for (j = 0; j < 100000; j++)
        sum_fibs();
    end = systime();
    print "sum fibs:", end - begin, "seconds", "/", 100000
}
