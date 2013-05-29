r = Hash.new

(1..333).each do |a|
  (a..1000).each do |b|
    c_2 = a ** 2 + b ** 2
    c = Math.sqrt(c_2).to_i
    next if c < b
    s = a + b + c
    break if s > 1000

    if c ** 2 == c_2
      # puts "#{s} #{a} #{b} #{c}"
      if r[s].nil?
        r[s] = 0
      end
      r[s] += 1
    end
  end
end

puts r.key(r.values.max)
