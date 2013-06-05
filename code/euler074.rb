def fac(n=0,s=1)
  return 1 if n <= 1
  (s..n).inject(:*)
end


$f = (0..9).map{|e| fac(e)}.to_a

$known = Hash.new

def sum_fac(n)
  n.to_s.chars.map(&:to_i).map{|d| $f[d]}.inject(:+)
end


r = (1...1000000).select do |n|
  h = Hash.new
  h[n] = 1
  i = 1
  s = n

  while i <= 61
    s = sum_fac(s)
    if $known.key? s
      i += $known[s]
      break
    end

    break if h.key? s

    i += 1
    h[s] = 1
  end

  # puts n if n % 100000 == 0

  $known[n] = i

  i == 60
end

puts r.count
