found = false

(2..10).step(1) do |k|
  a = 10 ** k
  b = (10 ** (k+1))/6
  (a..b).each do |n|
    s =(1..6).map{|i| n * i}.map(&:to_s).map(&:chars).map(&:sort).uniq
    if s.length == 1
      found = true
      puts "#{n} #{6*n}"
      break
    end
  end

  break if found == true
end
