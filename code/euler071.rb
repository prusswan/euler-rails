r = (1..1000000).map do |d|
  limit = (d * Rational(3,7)).floor
  n = limit

  limit.step(1,-1).each do |i|
    if d.gcd(i) == 1
      n = i
      break
    end
  end

  Rational(n,d)
end

a = r.sort
puts a[a.index(Rational(3,7))-1]

