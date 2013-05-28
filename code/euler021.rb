d = Hash.new

(2..10000).each do |n|
  d[n] = (1..n-1).select{ |i| n%i==0 }.inject(:+)
end

# puts d[220]
# puts d[284]

puts d.keys.select{ |k| k == d[d[k]] and d[k] != k }.inject(:+)
