k = Rational(1,2)

s = 0

(1..1000).each do |i|
  n = k + 1
  s += 1 if n.numerator.to_s.length > n.denominator.to_s.length

  k = 1 / (k + 2)
end

puts s
