r = (1...100).map do |a|
  (1...100).map do |b|
    s = (a ** b).to_s.chars.map(&:to_i).inject(:+)
    # puts s
    s
  end
end.flatten

puts r.max
