#!/usr/bin/ruby

MAX_T = 1000000

def get_maxb(t)
	(t - 1) / 2
end

def process(b)
	res = []
	a = b + 2
	while (a**2 - b**2 <= MAX_T)
		d = a**2 - b**2
		res << d
		a += 2
	end
	res
end

def solve(n)
	counts = Array.new(MAX_T + 1, 0)

	for b in 1..get_maxb(MAX_T)
		process(b).each {|d| counts[d] += 1}
	end

	type_counts = Array.new(MAX_T + 1, 0)
	counts.each { |count| type_counts[count] += 1 }

	res = 0
	(1..n).each { |i| res += type_counts[i] }
	res
end

N = ARGV[0].to_i

puts "N = #{N}"

puts "Result: #{solve(N)}"

