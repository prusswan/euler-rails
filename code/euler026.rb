r = (1..1000).map do |n|
  d = Hash.new
  a = 1
  c = 1
  l = 10 ** n.to_s.length


  # puts "n: #{n} #{d[a].inspect}"

  while true do
    d[a] ||= []
    # puts "a: #{a} #{d[a].inspect}"

    break if d[a].length > 1
    d[a] = d[a].push(c)

    a = (a * l) % n
    c = c+1
  end

  a == 0 ? 0 : (d[a][-1] - d[a][-2]) * n.to_s.length
end

# puts r.max
puts r.index(r.max) + 1

