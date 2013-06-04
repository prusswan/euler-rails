require 'prime'

# Attempt 1: this method is too slow, it is faster to check only certain prime combinations

best = 1000000
bestn = 0

(2...10000000).each do |n|
  count = n.prime_division.map { |e| 1 - Rational(1,e.first) }.inject(n, :*).to_i

  ns = n.to_s.chars.sort
  cs = count.to_s.chars.sort

  next unless ns == cs

  r = Rational(n,count)

  if r < best # or true # if n % 10000 == 0
    best = r
    bestn = n
    puts "#{n}: t:#{count} r:#{r}"
  end
end

puts "best n: #{bestn} r: #{best}"
