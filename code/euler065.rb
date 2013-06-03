# 1 0 puts 2
# 2 1 puts 2 + 1 / 1
# 3 2 # puts 2 + 1 / (1 + Rational(1,2))
# 4 1 # puts 2 + 1 / (1 + 1/(2 + Rational(1,1)))
# 5 1
# 6 4
# 7 1
# 8 1
# 9 6
# 10 1

n = Rational(0)

c = 100

c.step(2,-1).each do |i|
  d = i%3 == 0 ? i/3 * 2 : 1
  n += d

  n = 1/n
end

n += 2

puts n.numerator.to_s.chars.map(&:to_i).inject(:+)
