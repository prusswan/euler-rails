# Attempt 1: too slow

# limit = 12000 # 1500000

# count = 0

# 12.step(limit,2) do |m|
#   found = false

#   (3..m/3).each do |a|
#     upper = (m - a)/2 # b + c
#     a2 = a ** 2
#     (a+1..upper).each do |b|
#       c = m - a - b
#       b2 = b ** 2

#       next unless c ** 2 == a2 + b2

#       # puts "#{a} #{b} #{c}"
#       found = true
#       break
#     end

#     break if found == true
#   end

#   count += 1 if found == true

#   puts m if m%10000 == 0
# end

# puts count


# Attempt 2: modified algorithim for generating pythagorean triples

class PythagoranTriplesCounter
  def initialize(limit)
    @limit = limit
    @total = 0
    @primatives = 0
    @perims = Hash.new
    generate_triples(3, 4, 5)
  end
  attr_reader :total, :primatives, :perims

  private
  def generate_triples(a, b, c)
    perim = a + b + c
    return if perim > @limit

    # p [perim, a,b,c]
    d = [a,b,c].sort
    perim.step(@limit, perim) do |p|
      f = p/perim
      arr = d.map{ |e| e * f }

      if !@perims.key? p
        @perims[p] = []
      end
      @perims[p] << arr
    end


    @primatives += 1
    @total += @limit / perim

    generate_triples( a-2*b+2*c, 2*a-b+2*c, 2*a-2*b+3*c)
    generate_triples( a+2*b+2*c, 2*a+b+2*c, 2*a+2*b+3*c)
    generate_triples(-a+2*b+2*c,-2*a+b+2*c,-2*a+2*b+3*c)
  end
end

perim = 1500000 # 1500000

c = PythagoranTriplesCounter.new perim
p [perim, c.total, c.primatives, c.perims.keys.length]

k = c.perims

r = k.keys.select{|m| k[m].uniq.length == 1}
puts r.count
