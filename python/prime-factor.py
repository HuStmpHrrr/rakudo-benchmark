#!/usr/bin/env python

import timeit

timer = timeit.Timer(stmt='''\
def candidates():
    yield 2
    yield 3
    acc = 5
    while True:
        yield acc
        acc += 2

def lpf(n):
    for i in candidates():
        while n % i == 0:
            n /= i
            if i > n: return i
''')

print 'prime factor: {} seconds / 10000000'.format(timer.timeit(10000000))
