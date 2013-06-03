cubes = Hash.new


(1..10000000).each do |n|
  c = n ** 3
  s = c.to_s.chars.sort

  if !cubes.key? s
    cubes[s] = []
  end

  cubes[s] << c

  if cubes[s].length == 5
    puts cubes[s].inspect
    break
  end

  puts "iterations: #{n}" if n%1000 == 0
end
