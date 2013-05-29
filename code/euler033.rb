r = []
(10..99).each do |a|
  (a+1..99).each do |b|
    n = a.to_s
    m = b.to_s

    f = "#{n}/#{m}"

    next if (n[1] == '0' and m[1] == '0')
    next if (n[0] == n[1] and m[0] == m[1])
    next if (n[0] != m[0] and n[0] != m[1] and n[1] != m[0] and n[1] != m[1])

    [[0,0],[0,1],[1,0],[1,1]].each do |s|
      i,j = s.first, s.last
      next if n[i] != m[j]
      next if m[1-j] == '0'
      g = "#{n[1-i]}/#{m[1-j]}"
      r << f.to_r if f.to_r == g.to_r
    end
  end
end

puts r.inject(:*).denominator
