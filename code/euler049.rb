limit = 10000
$primes = Hash.new

$primes[2] = 1

(2..limit).each do |c|
  is_prime = true
  next if c%2==0

  (3..(c**0.5).floor).step(2) do |d|
    if c%d==0

      is_prime = false
      break
    end
  end

  if is_prime == true
    $primes[c] = 1
  end
end

def arr(n)
  n.to_s.chars.sort
end

c = $primes.keys.select {|e| e > 1487}

c.each do |i|
  f = i + 3330
  g = f + 3330

  break if g > c.last

  k = arr(i)

  next unless c.include? f and arr(f) == k
  next unless c.include? g and arr(g) == k

  puts "#{i}#{f}#{g}"
end


