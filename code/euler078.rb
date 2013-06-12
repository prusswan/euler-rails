k = 200

$pen = (1..k).map do |n|
  s = n * (3*n - 1)/2
  s2 = (-n) * (3*(-n) - 1)/2
  c = 1
  if n%2 == 0
    c *= -1
  end
  [[s,c],[s2,c]]
end.flatten(1)


puts $pen.last.inspect

$p_store = Hash.new

def p_count(n)
  if n < 0
    return 0
  elsif n == 0
    return 1
  end

  if !$p_store.key? n
    s = $pen.select { |e| e.first <= n }.map do |e|
      # puts e.inspect
      p_count(n-e.first) * e.last
    end.inject(:+)
    $p_store[n] = s

  end

  return $p_store[n]
end

(1..100000).each do |e|
  # puts "#{e}: #{p_count(e)}" if e%10000==0
  if p_count(e)%1000000==0
    puts "#{e}: #{p_count(e)}"
    break
  end
end
