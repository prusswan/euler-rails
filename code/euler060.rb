require 'prime'

c = [3,11,701,8747] # [3, 7, 109, 673]

c = [3,7,673]

c = [7,19,97] #,3727]

c = [3,17,449,2069]

c = [3, 7, 541,4159]
# c = [991,19,31,8641]
c = [13,19,577] #,709]
c = [7,19,937]

c = [13,19,997]
c = [11,23,743,1871]
c = [19,31,181]
c = [3,11,701,53777]
c = [3,17,39821]

c = [97,35311, 1039]
c = [3,7,55171,4159]
c = [3,37,1237]
c = [3,103,9901]
c = [97,7,3727]

c = [3,37,67,5923, 194119] #  good set #1 200149
c = [7,61,25939,26893,63601] # good set #2: 116501

c = [13,5197,5701,6733,8389] # good set #3: 26033
puts "sum: #{c.inject(:+)}"

$checked = Hash.new
$concat = Hash.new

def check_prime(n)
  unless $checked.key? n
    $checked[n] = n.prime?
  end

  $checked[n]
end

def check_pair(arr, p)
  found = true
  arr.each do |e|
    s = [e,p].sort
    if !$concat.key?(s)
      $concat[s] = check_prime((e.to_s + p.to_s).to_i) && check_prime((p.to_s + e.to_s).to_i)
    end

    if !$concat[s]
      found = false
      break
    end
  end

  found == true
end

### manual identification of prospective primes

# Prime.each do |p|

#   if p > 116501 or (c.length == 1 and p > 12000)
#     puts "range exceeded"
#     break
#   end

#   found = true
#   c.each do |e|
#     r = check_prime((e.to_s + p.to_s).to_i)
#     if !r
#       found = false
#       break
#     end

#     r = check_prime((p.to_s + e.to_s).to_i)
#     if !r
#       found = false
#       break
#     end
#   end

#   next unless check_pair(c,p)


#   if p.to_s =~ /^[13579]+$/ or true
#     puts p
#   end

# end


# Attempt 1: implemented a known bruteforce solution, still not fast enough
# need to revisit this problem at some later date


$limit = 30000

p = []
Prime.each do |e|
  next if e == 2 or e == 5
  break if e >= $limit
  p << e
end

arr = []
(0...p.length).each do |a|
  puts "element: #{p[a]}"
  arr = [p[a]]
  (a+1...p.length).each do |b|
    break if arr.inject(:+) + p[b] * 4 > $limit
    next unless check_pair(arr,p[b])
    arr << p[b]
    (b+1...p.length).each do |c|
      break if arr.inject(:+) + p[c] * 3 > $limit
      next unless check_pair(arr,p[c])
      arr << p[c]
      (c+1...p.length).each do |d|
        break if arr.inject(:+) + p[d] * 2 > $limit
        next unless check_pair(arr,p[d])
        arr << p[d]
        (d+1...p.length).each do |e|
          break if arr.inject(:+) + p[e] > $limit
          next unless check_pair(arr,p[e])

          arr << p[e]
          puts "match: #{arr.inspect} #{arr.inject(:+)}"
        end
        arr.pop
      end
      arr.pop
    end
    arr.pop
  end

end





