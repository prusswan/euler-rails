$p_store = Hash.new

def p_count(n)
  if n < 0
    return 0
  elsif n == 0
    return 1
  end

  if !$p_store.key? n
    s = (1..n).map do |k|
      a = n-k*(3*k-1)/2
      b = n-k*(3*k+1)/2
      (-1)**(k+1) * (p_count(a) + p_count(b))
    end.inject(:+)
    $p_store[n] = s
  end

  return $p_store[n]
end

puts p_count(100) - 1
