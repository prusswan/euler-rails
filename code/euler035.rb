limit = 1000000
$primes = (0..limit).to_a

# using proper prime sieve

(2+2..limit).step(2) { |i| $primes[i] = false }
(3..1000).step(2) do |c|
  (c+c..limit).step(c) do |n|
    $primes[n] = false
  end
end

# puts $primes.keys.max
# puts $primes[2..10]
r = []

$primes[2..-1].select{ |e| e }.each do |p|
  s = p.to_s.chars.to_a
  t = s
  cyclic = true
  while t = t.rotate
    break if s == t
    if $primes[t.join.to_i] == false
      cyclic = false
      break
    end
  end

  r << p if cyclic == true
end

puts r.size
