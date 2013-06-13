input = %Q{
  131 673 234 103 18
  201 96  342 965 150
  630 803 746 422 111
  537 699 497 121 956
  805 732 524 37  331
}

i = input.strip.split(/\s*\n\s*/).map { |n| n.split.map(&:to_i) }

# puts i.inspect

# (1...i.length).each do |k|
#   i[0][k] += i[0][k-1]
#   i[k][0] += i[k-1][0]
# end


# puts i.inspect

(1...i.length).each do |m|
  s = (0...i.length).map do |n|
    a = [ i[n][m-1] ]
    a << i[n+1][m] if n < i.length - 1
    a << i[n-1][m] if n > 0

    puts "#{i[n][m]} #{n} #{m} #{a.inspect}"
    i[n][m] + a.min
  end

  (0...i.length).each { |n| i[n][m] = s[n] }
end

puts i.inspect
puts i.map{ |e| e[-1] }.min
