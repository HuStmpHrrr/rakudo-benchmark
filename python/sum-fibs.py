#!/usr/bin/env python

import timeit

timer = timeit.Timer(stmt='''\
def fib():
    ret = [1, 1]
    i = 0
    while ret[-1] <= 4000000:
        ret.append(ret[i] + ret[i+1])
        i += 1
    return ret
a = sum(i for i in fib() if i % 2 == 0)
''')

print 'sum fibs: {} seconds / 100000'.format(timer.timeit(100000))
