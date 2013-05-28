months = [31,28,31,30,31,30,31,31,30,31,30,31]
leap_months = [31,29,31,30,31,30,31,31,30,31,30,31]


days = []

d = 1 + 365

r = (1901..2000).map do |y|
  if y%4 == 0
    leap_months
  else
    months
  end
end

# puts r.size

puts r.flatten.inject([d]) { |a,e| a << e + a.last.to_i  }.select{ |e| e%7==0 }.count
