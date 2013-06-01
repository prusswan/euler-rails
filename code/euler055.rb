def flip(n)
  n.to_s.reverse.to_i
end

def is_palin(n)
  n.to_s == flip(n).to_s
end


r = (1...10000).map do |n|
  lychrel = 0
  k = n
  (1..50).each do |i|
    k = k + flip(k)
    if is_palin(k)
      lychrel = i
      break
    end
  end
  # puts lychrel
  lychrel
end

puts r.select{|e| e == 0}.count


