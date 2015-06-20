#!/usr/bin/env python

import timeit

timer = timeit.Timer(setup='''\
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
''', stmt='lpf(600851475143)')

print 'prime factor: {} seconds / 1000'.format(timer.timeit(1000))
