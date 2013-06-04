require 'prime'

best = 0
bestn = 0

(2..1000000).each do |n|
  count = n.prime_division.map { |e| 1 - Rational(1,e.first) }.inject(n, :*).to_i

  r = Rational(n,count)

  if r > best # or true # if n % 10000 == 0
    best = r
    bestn = n
    puts "#{n}: t:#{count} r:#{r}"
  end
end

puts "best n: #{bestn} r: #{best}"
