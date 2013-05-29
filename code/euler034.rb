$memo = Hash.new

def fac(n=0,s=1)
  return 1 if n <= 1

  if $memo[n].nil?
    $memo[n] = (s..n).inject(:*)
  end
  $memo[n]
end

def digits(n)
  n.to_s.chars.map(&:to_i)
end

r = (3..3628800).select do |n|
  c = digits(n).inject(0) {|s,v| s + fac(v) }
  n == c
end

puts r.inject(:+)
