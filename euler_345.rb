#!/usr/bin/ruby

require './euler_lib.rb'

def solve(n, matrix)
	a = Array.new(n+1)
	for i in 0..n+1 do
		a[i] = Array.new(2**n, 0)
	end

	for row in 1..n do
		for old_mask in 0...2**n do
			for k in 0...n do
				if BitMask.get(old_mask, k) == 0 then
					new_mask = BitMask.set(old_mask, k, 1)
					a[row][new_mask] = [a[row][new_mask], a[row-1][old_mask] + matrix[row-1][k]].max
				end	
			end
		end
	end

	a[n][2**n - 1]
end

matrix = read_matrix('./data/345_input_1')

n = matrix.length
puts "N=#{n}"

res = solve(n, matrix)
puts "Result=#{res}"

