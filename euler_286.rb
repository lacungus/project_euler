#!/usr/bin/ruby

EPS = 1e-13

def f(n, s, q)
	a = Array.new(n + 1)
	for i in 0..n do
		a[i] = Array.new(n + 1, 0.0)
	end
	a[0][0] = 1.0

	for i in 1..n
		a[i][0] = a[i-1][0] * (i/q)

		for j in 1..n
			a[i][j] = (i/q) * a[i-1][j] + (1 - i/q)*a[i-1][j-1]
		end
	end

	a[n][s]
end

def binsearch(n, s, target, left, right, func)
	while right - left > EPS
		middle = (right + left) / 2
		res = middle
		v = func.call(n, s, middle)
		if (v > target)
			left = middle + EPS
		else
			right = middle - EPS
		end
	end
	res
end

N = ARGV[0].to_i
S = ARGV[1].to_i
TARGET = ARGV[2].to_f
LEFT = ARGV[3].to_f
RIGHT = ARGV[4].to_f

puts "N=#{N} S=#{S} TARGET=#{TARGET} LEFT=#{LEFT} RIGHT=#{RIGHT}"

puts binsearch(N, S, TARGET, LEFT, RIGHT, method(:f))

