$primes = Hash.new
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
    $primes[c] = 1
    counter+=1
  end
end

def q(a,b)
  n=0

  while true do
    s = n ** 2 + a * n + b
    n += 1
    break if $primes[s].nil?
  end

  n
end

max = 0
good = []

(-999..999).each do |a|
  (-999..999).each do |b|
    c = q(a,b)
    if c > max
      max = c
      good = [a,b]
      puts "max: #{max} #{good.inspect}"
    end
  end
end

puts good.inject(:*)
