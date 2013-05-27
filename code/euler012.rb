tri = Fiber.new do
  i = n = 1
  loop do
    Fiber.yield n
    i+=1
    n+=i
  end
end


require 'prime'
t = 0
while t = tri.resume
  f = t.prime_division
  divisors = f.map(&:last).inject(1) { |p,v| p * (v+1) }
  break if divisors > 500
end
puts "#{t}, #{divisors}"
