$primes = Hash.new

$primes[2] = 1

(1..9).each do |i|
  s = (1..i).to_a.permutation.select{|e| [1,3,5,7,9].include? e.last}.map(&:join).map(&:to_i)

  s.each do |c|
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
end

puts $primes.keys.max
