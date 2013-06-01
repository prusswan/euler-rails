plen = 6
limit = 10 ** plen - 1
$primes = Hash.new

# $primes[2] = 1

(100001..limit).each do |c|
  is_prime = true
  next if c%2==0

  (3..(c**0.5).floor).step(2) do |d|
    if c%d==0

      is_prime = false
      break
    end
  end

  if is_prime == true
    $primes[c] = 1
  end
end


p = $primes.keys


m = (1..2**(plen-1)-1).map{|e| (e.to_s(2) + '0').rjust(plen,'0') }.map{ |e| [e.to_i, e.split('').each_index.select{|i| e[i] == '1'}] }

# puts  m
b = Hash.new

m.each do |k|
  # puts k.inspect
  p.each do |i|
    next unless i.to_s.split('').values_at(*k.last).uniq.count == 1

    if b[k.last].nil?
      b[k.last] = []
    end

    b[k.last] = b[k.last] << i
  end
end

found = false

b.keys.each do |i|
  # puts i.inspect if i == [2,3]
  a = (0...plen).to_a - i
  c = Hash.new
  b[i].each do |j|
    v = j.to_s.split('').values_at(*a).join.to_i
    if c[v].nil?
      c[v] = 0
    end
    c[v] = c[v] + 1
    if c[v] == plen + 2
      found = true

      puts [v, i].inspect

      m = (0..2).map do |k|
        h = j.to_s
        i.each { |e| h[e] = k.to_s }
        h.to_i
      end.select { |e| p.include? e }

      puts m.min
      break
    end
    # puts j if i == [2,3]
    # puts c[v] if i == [2,3]
    break if found == true
  end
  puts c.key(plen + 2) if c.value?(plen + 2)
end
