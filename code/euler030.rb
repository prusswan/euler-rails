r = (2..300000).select do |n|
  s = n.to_s.chars.map{|c| c.to_i ** 5 }.inject(:+)
  n == s
end

puts r.inject(:+)
