(2..1000).each do |a|
  (a+1..1000).each do |b|
    c_2 = a * a + b * b
    c = Math.sqrt(c_2).to_i
    if c ** 2 == c_2 and a + b + c == 1000
      puts "#{a} #{b} #{c}: #{a * b * c}"
      break
    end
  end
end
