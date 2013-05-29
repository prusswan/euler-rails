r = (1...1000000).select do |n|
  b = n.to_s(2)
  s = n.to_s
  s2 = s.reverse
  b2 = b.reverse
  s2 == s and b2 == b and !s2.start_with?('0') and !b2.start_with?('0')
end

# puts r
puts r.inject(:+)
