r = (0..9).to_a.permutation.select{|e| e.first != 0 && [0,5].include?(e[5]) && e[1..3].join.to_i % 2 == 0}.map(&:join).select do |n|
  sudb = true

  # if n[1..3].to_i % 2 > 0 ||
  if n[2..4].to_i % 3 > 0 ||
     # n[3..5].to_i % 5 > 0 ||
     n[4..6].to_i % 7 > 0 ||
     n[5..7].to_i % 11 > 0 ||
     n[6..8].to_i % 13 > 0 ||
     n[7..9].to_i % 17 > 0
    sudb = false
  end

  sudb == true
end

puts r.count
puts r.map(&:to_i).inject(:+)
