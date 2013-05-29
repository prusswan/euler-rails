p=[1,2,5,10,20,50,100,200]

# Attempt 1 (too slow! too much storage used)


# c = Hash.new
# c[0] = [[]]

# (1..200).each do |n|
#   s = p.map { |i| n-i }.select { |j| j >= 0 }
#   # puts s.inspect

#   c[n] = s.map { |i|
#     c[i].map do |e|
#       # puts "c[#{i}]: #{c[i]}, #{n-i} added to #{e}";
#       (e + [n-i]).sort
#     end
#   }.flatten(1).uniq

#   puts "#{n}: #{c[n].size}"
# end


# Attempt 2 (someone else's step method, much faster)


# s = 0
# 0.step(200, 200) {|a|
#   a.step(200, 100) {|b|
#     b.step(200, 50){|c|
#       c.step(200, 20){|d|
#         d.step(200, 10){|e|
#           e.step(200, 5){|f|
#             f.step(200, 2){|g|
#               s += 1}}}}}}}
# puts s


# Attempt 3 (someone else's dp solution)

a = (1..201).map { Array.new(8,0) }


(1..200).each do |n|
  (0..7).each do |i|
    if (n-p[i] >= 0) # if coin can be used
      # A: combinations using smaller coins
      # B: combinations (n-coin) that already uses this coin
      a[n][i] = a[n][i-1] + a[n-p[i]][i]

      # C: n == p
      a[n][i] += 1 if n == p[i]
    else
      a[n][i] = a[n][i-1]  # no difference from using smaller coins
    end
  end
end

# puts a[1..5].inspect
puts a[200][7]
