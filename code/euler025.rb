fibonaccis = Fiber.new do
  t = n1 = n2 = 1

  loop do
    Fiber.yield t

    break if n1.to_s.length >= 1000

    n1, n2 = n2, n1+n2
    t = t+1
  end
end

r = 0

while f = fibonaccis.resume do
  r = f
end

puts r
