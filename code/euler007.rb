primes = []
limit = 110000

counter = 0

(2..limit).each do |c|
  is_prime = true
  (2..(c**0.5).floor).each do |d|
    if c%d==0
      is_prime = false
      break
    end
  end

  if is_prime == true
    primes << c
    counter+=1
  end
end

puts "#{counter}: #{primes[10000]}"
