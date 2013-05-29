limit = 1000000
$primes = (0..limit).to_a

# using proper prime sieve

$primes[0] = $primes[1] = false
(2+2..limit).step(2) { |i| $primes[i] = false }
(3..1000).step(2) do |c|
  (c+c..limit).step(c) do |n|
    $primes[n] = false
  end
end

# puts $primes.keys.max
# puts $primes[2..10]
r = []

$primes[2..-1].select{ |e| e and e.to_s.length > 1 }.each do |p|
  s = p.to_s
  truncatable = true
  (1..s.length-1).each do |i|
    n = s[i..-1]
    m = s[0..(-1-i)]

    # puts "#{s}: #{n} #{m}"

    if $primes[m.to_i] == false or $primes[n.to_i] == false
      truncatable = false
      break
    end
  end

  r << p if truncatable == true
end

puts r.size
puts r.inject(:+)
