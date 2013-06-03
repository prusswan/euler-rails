count = 1 # 1 ** 1 == 1
(2..10000).each do |a|
  (1..10000).each do |n|
    s = (a ** n).to_s
    next if s.length < n
    if s.length == n
      puts "#{a} ** #{n} == #{s}"
      count += 1
    elsif s.length > n
      break
    end
  end
  # puts "n: #{n}"
  break if (a ** 2).to_s.length > a + 1
end

puts count
