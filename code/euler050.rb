limit = 1000000
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


s = $primes.keys

# sum = 0
# (0...s.length).each do |i|
#   sum += s[i]
#   if sum >= limit
#     puts "#{i}"
#     break
#   end
# end

# upper limit: 546

m = s[0..545].inject(:+)

found = false

546.step(1,-1) do |i|
  k = m
  (0..(s.length-1-i)).each do |j|
    # puts k
    break if k > limit

    if s.include? k
      puts "#{j} #{i} #{k}"
      found = true
      break
    end

    k = k - s[j] + s[j+i]
  end

  break if found == true
  m = m - s[i-1]
end
