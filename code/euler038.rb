p = (1..9).to_a

r = []

(9000..9876).each do |i|
  s = [i,i*2].map(&:to_s).join
  if p == s.chars.map(&:to_i).sort
    r << s.to_i
    puts "#{i}: #{s}"
  end
end

(90..98).each do |i|
  s = [i,i*2,i*3].map(&:to_s).join
  break if s.length > 9
  if p == s.chars.map(&:to_i).sort
    r << s.to_i
    puts "#{i}: #{s}"
  end
end

puts r.max
