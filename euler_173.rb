#!/usr/bin/ruby

def get_maxb(n)
	(n - 1) / 2
end

def get_count_for_b(n, b)
	left = b
	right = n 

	max_a = 0
	while left <= right
		middle = (right + left) / 2
		if (middle**2 - b**2 > N)
			right = middle - 1
		else
			max_a = middle
			left = middle + 1
		end	
	end

	#puts "#{b} #{max_a} #{max_a - b} #{max_a**2 - b**2}"	
	(max_a - b)/2
end

def solve(n)
	res = 0
	for b in 1..get_maxb(n)
		res += get_count_for_b(n, b)
	end
	res
end

N = ARGV[0].to_i

puts "N = #{N}"

puts "Result: #{solve(N)}"

