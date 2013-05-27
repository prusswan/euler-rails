require 'prime'

factors = Hash.new(0)

(2..20).each do |c|
  c.prime_division.each do |p|
    puts "#{c}: #{p.to_s}"
    if factors[p.first].nil? or factors[p.first] < p.last
      factors[p.first] = p.last
    end
  end
end

# puts factors.keys

puts factors.keys.inject(1) { |product, key| product * key ** factors[key]}
