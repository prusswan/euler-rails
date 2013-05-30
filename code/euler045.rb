limit = 100000

t = (1..limit).map { |n| n*(n+1)/2 }
p = (1..limit).map { |n| n*(3*n-1)/2 }
h = (1..limit).map { |n| n*(2*n-1) }


# puts t.size
# puts p.count
# puts h.count

s = t & p
# puts s.count

r = s & h
# puts r.count

puts r[r.index(40755)+1]
