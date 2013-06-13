require 'bigdecimal/math'

include BigMath

r = (1..100).select do |e|
  Math.sqrt(e).floor ** 2 != e
end.map do |n|
  s = BigMath::sqrt(BigDecimal.new(n),175).to_s[2..101]
  s.chars.map(&:to_i).inject(:+)
end

# puts r.count
puts r.inject(:+)
