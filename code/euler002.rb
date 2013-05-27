fibonaccis = Fiber.new do
  n1 = n2 = 1
  # sum = 0
  loop do
    # break if n1 > 4000000

    if n1%2 == 0
      Fiber.yield n1
      # sum += n1
    end

    n1, n2 = n2, n1+n2
  end
end

sum = 0
while f = fibonaccis.resume and f < 4000000
  sum += f
end
puts sum
