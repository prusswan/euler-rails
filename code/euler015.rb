def fac(n=0,s=1)
  return 1 if n <= 1
  (s..n).inject(:*)
end

result = fac(40,21) / fac(20)
puts result
