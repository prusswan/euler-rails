factors = Fiber.new do
  n1 = 2
  goal = 600851475143
  loop do
    break if goal == 1
    if goal%n1 == 0
      Fiber.yield n1
      goal = goal/n1
      n1 = 2
    else
      n1 += 1
    end
  end
end

primes = Hash.new(0)
while f = factors.resume
  primes[f] = primes[f] + 1
end

puts primes.keys.last
