limit = 10000
$primes = Hash.new

# $primes[2] = 1

(1..limit).each do |c|
  is_prime = true

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


(3..limit).step(2) do |n|
  next if $primes.key? n
  is_gold = false

  # much faster to enumerate squares since they scale faster
  (1..Math.sqrt((n-3)/2).floor).each do |i|
  # $primes.keys.each do |i|

    # break if i >= n
    s = 2 * (i ** 2)
    if $primes.key? (n-s)
      is_gold = true
      break
    end
  end

  unless is_gold
    puts n
    break
  end
end
