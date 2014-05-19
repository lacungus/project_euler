class BitMask
	def self.get(value, index)
		(value >> index) & 1
	end

	def self.set(value, index, bit)
		if bit == 1 then value | (1 << index) else value & ~(1 << index) end
	end
end

def read_matrix(input_file_name)
	res = Array.new
	File.open(input_file_name).each { |line| res << line.strip.split(/\s+/).map(&:to_i) }
	res
end

