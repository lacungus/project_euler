#!/usr/bin/ruby

MODULO = 1000000000

def alpha(n)
	(n * n * (n + 1) / 2)
end

def beta(n)
	sum = 0

	sqrt_n = Math.sqrt(n)
	a = 0 

	for k in 1..sqrt_n
		if (k % 10000 == 0)
			puts k
		end
		a = n / (k + 1) + 1
		sum = sum + delta(n, n/(k + 1) + 1, n / k, k)
		sum = sum % MODULO
	end
	
	if a > 0
		for k in 1...a
			sum += k * (n % k)
		end
	end
	 
	sum
end

def delta(n, a, b, k)
	if (a > b)
		return 0
	end
	#puts "delta input: #{a} #{b} #{k}"
	d1 = delta2(n, b, k)
	d2 = delta2(n, a - 1, k)
	if (d2 < 0)
		d2 = 0
	end
	#puts "d1=#{d1} d2=#{d2}"
	res = d1 - d2
	if (res < 0)
		return 0
	end
	#puts "delta output: #{res}"
	res
end

def delta2(n, i, k)
	n*(i+1)*i/2 - k*i*(i+1)*(2*i+1)/6
end

def gamma(n)
	res = alpha(n) - beta(n)
	res = res % MODULO
	res
end

def turns(n)
	factors(n + 1)
end

def factors(n)
	res = []
	sqrt_n = Math.sqrt(n)

	for i in 1..sqrt_n
		if n % i == 0
			res << i
			res << n/i
		end
	end
	res.uniq.sort
end

n = ARGV[0].to_i

puts "n: #{n}"

puts "alpha: #{alpha(n)}"

#puts "beta: #{beta(n)}"

puts "gamma: #{gamma(n)}"
