#!/usr/bin/ruby

EPS = 1e-15

def get_s(n, r)
	sum = 0
	mult = 1
	for k in 1..n
		sum += (900 - 3*k) * mult
		mult *= r
	end
	sum
end

def solve(n, target, low, high)
	res = 0
	while (1) do
		middle = (high + low) / 2
		s = get_s(n, middle)
		if (s - target).abs < 0.6 then 
			return middle 
		end
		if s > target
			low = middle + EPS
		else
			high = middle - EPS
		end
	end
end

N = ARGV[0].to_i
TARGET = ARGV[1].to_f
LOW = ARGV[2].to_f
HIGH = ARGV[3].to_f

puts "N=#{N}"
puts "TARGET=#{TARGET}"
puts "LOW=#{LOW}"
puts "HIGH=#{HIGH}"

res = solve(N, TARGET, LOW, HIGH)

puts "Result=#{res}"

