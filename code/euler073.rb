r = (1..12000).map do |d|
  upper_limit = (d * Rational(1,2)).floor
  lower_limit = (d * Rational(1,3)).ceil

  a = 0

  (lower_limit..upper_limit).each do |i|
    if d.gcd(i) == 1
      a += 1 # << Rational(i,d)
    end
  end

  # puts d if d%1000 == 0
  a
end

puts r.inject(:+) - 2
