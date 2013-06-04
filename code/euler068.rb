(1..10).to_a.permutation.each do |p|
  # next unless p[0] == 9
  next unless [p[2],p[4],p[6],p[8]].include? 10

  # numerically lowest external node
  next if p[0] > p[2]
  next if p[0] > p[4]
  next if p[0] > p[6]
  next if p[0] > p[8]

  s1 = p[0] + p[1] + p[3]
  s2 = p[2] + p[3] + p[5]
  next if s2 != s1

  s3 = p[4] + p[5] + p[7]
  next if s3 != s2
  s4 = p[6] + p[7] + p[9]
  next if s4 != s3

  s5 = p[8] + p[9] + p[1]
  next if s5 != s4

  s = "#{p[0]}#{p[1]}#{p[3]}#{p[2]}#{p[3]}#{p[5]}" +
    "#{p[4]}#{p[5]}#{p[7]}#{p[6]}#{p[7]}#{p[9]}" +
    "#{p[8]}#{p[9]}#{p[1]}"

  puts s
  # puts "#{s1} #{s2} #{s3} #{s4} #{s5}"
end
