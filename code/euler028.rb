r = (2..501).map do |n|
  a = (2*n - 1) ** 2
  b = 6 * (n - 1)

  2 * (2 * a - b)
end

puts r.inject(:+) + 1
