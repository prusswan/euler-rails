$pens = Hash.new

def is_pen(n)
  return $pens[n] if $pens.key?(n)

  r = (24 * n + 1)
  s = Math.sqrt(r).to_i
  $pens[n] = (s ** 2 == r and s % 6 == 5)
  return $pens[n]
end

def pen(n)
  p = n*(3*n-1)/2
  $pens[p] = true unless $pens.key?(p)
  p
end

def unpen(n)
  r = (24 * n + 1)
  s = Math.sqrt(r).to_i
  (s+1)/6
end

# (1..1000000).each do |n|
#   (n+1..limit).each do |m|
#     # s = m*(3*m + 6*n -1)/2
#     if is_pen(pen(m) - pen(n)) and is_pen(pen(m) + pen(n))
#     # if is_pen(s) # and is_pen(pen(n) + pen(n+m))
#       puts "#{n} #{m} #{unpen(pen(m)-pen(n))}"
#       break
#     end
#   end
# end


# Attempt 1:

# best = 2000 # upper limit obtained through trial and error -.-

# (1..2000).each do |n|
#   break if 3*n+1 > pen(best)
#   # puts "cycle: #{n}" if n%10000 == 0

#   (n..best).each do |m|
#     a = pen(n)
#     b = a + pen(m)

#     if is_pen(b) and is_pen(a+b)
#       best = m if m < best
#       puts "#{n} #{unpen(b)} #{m} #{pen(m)}"
#       break
#     end
#   end
# end

# puts best


# Attempt 2:  (someone else's, explains why the single entry is indeed the minimal)

# 1. Define smallest pair as pair which has minimal sum, that is minimal `m'
# 2. By definition:  P(n+i)+P(n) = P(m), P(n+i)-P(n) = P(k),
# where n,i,m,k - positive integers, from this it follows that: 2*P(n+i) = P(m)+P(k), 2*P(n) = P(m)-P(k)
# Therefor the solution is:
# Enumerate sums `P(m)', from smaller sums (smaller `m') to bigger one;
# for all possible differences `P(k)', where `k' less then `m'; while the sought quantity is not found.

found = false

(1..1000000).each do |m|
  (1..m-1).each do |k|
    pk = pen(k)
    pm = pen(m)

    p2 = pm + pk
    next unless p2 % 2 == 0
    p1 = pm - pk
    next unless p1 % 2 == 0

    if is_pen(p2/2) and is_pen(p1/2)
      puts "#{unpen(p1/2)} #{unpen(p2/2)} #{k} #{pk}"
      found = true
      break
    end
  end

  break if found
end
