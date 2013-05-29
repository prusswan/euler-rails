$primes = Hash.new
limit = 1000000

counter = 0

# should use a proper prime sieve but we're (still) lazy

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



# puts $primes.keys.max
r = []

$primes.keys.each do |p|
  s = p.to_s.chars.to_a
  t = s
  cyclic = true
  while t = t.rotate
    break if s == t
    if not $primes.include? t.join.to_i
      cyclic = false
      break
    end
  end

  r << p if cyclic == true
end

puts r.size
