p = (1..9).to_a

[39,186,7254].map(&:to_s).join.chars.map(&:to_i).sort

sum = []

(2..1000).each do |x|
  (100..9999).each do |y|
    z = x * y
    s = [x,y,z].map(&:to_s).join
    break if s.length > 9

    if p == s.chars.map(&:to_i).sort
      puts "#{x} #{y} #{z}"
      sum << z
    end
  end
end

puts sum.uniq.inject(:+)
