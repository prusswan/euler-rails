require 'prime'

r = (2..1000000).map do |n|
  count = n.prime_division.map { |e| 1 - Rational(1,e.first) }.inject(n, :*).to_i
  count
end.inject(:+)

puts r
