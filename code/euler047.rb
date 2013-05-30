require 'prime'

limit = 1000000

p1 = p2 = p3 = p4 = 0

(1..limit).each do |n|
  f = n.prime_division

  p1,p2,p3,p4 = f.length,p1,p2,p3

  if p1 == 4
    if p2 == p1 and p3 == p1 and p4 == p1
      puts "#{n-3}"
      break
    end
  end
end
