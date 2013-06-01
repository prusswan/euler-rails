def fac(n=0,s=1)
  return 1 if n <= 1
  (s..n).inject(:*)
end

r = (1..100).map do |i|
  (0..i).select {|e| fac(i)/fac(e)/fac(i-e) > 10 ** 6}.count
end

puts r.inject(:+)
