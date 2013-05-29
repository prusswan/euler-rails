s = (1..200000).map(&:to_s).join

puts (0..6).map{ |i| s[10**i-1].to_i }.inject(:*)
