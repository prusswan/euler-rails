a = (2..28123).select{ |n| (1..(n/2).floor).select{|s| n%s==0}.inject(:+)  > n }

b = Hash.new


a.each_with_index do |e,i|
  (i..a.length-1).each do |j|
    r = a[j] + e
    # puts r if (28120..28123).include? r
    b[r] = true if r <= 28123
  end
end

c = b.keys.inject(:+)

puts (28124 * 28123)/2 - c
