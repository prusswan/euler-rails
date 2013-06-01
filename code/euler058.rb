require 'prime'

limit = 10000000

c = 1

count = 0.0
total = 1

(3..limit).step(2) do |n|
  i = n-1

  (1..4).each do |k|
    c += i
    if c.prime?
      count += 1
    end
  end

  total += 4
  ratio = count/total

  if ratio < 0.1
    puts "#{n} #{c} #{ratio}"
    break
  end
end
