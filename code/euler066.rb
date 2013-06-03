bestx = 0
bestd = 0

# Attempt 1: not working, stuck at certain values



# (1..1000).each do |d|
#   # surd = 23

#   a = Math.sqrt(d).floor
#   next if a**2 == d

#   found = false
#   (2..100000000).each do |x|
#     m = (x ** 2) - 1
#     next unless m%d == 0

#     # puts "#{m} #{d}"

#     k = m/d

#     if Math.sqrt(k).floor ** 2 == k
#       puts "d:#{d} min x:#{x}"
#       if x > bestx
#         bestx = x
#         bestd = d
#       end
#       found = true
#       break
#     end
#   end
#   if found == false
#     puts "d:#{d} range exceeded!!"
#   end
# end




# Attempt 2: using Pell equation solver with surd fractional convergents


(1..1000).each do |surd|
  # surd = 23

  a = Math.sqrt(surd).floor
  next if a**2 == surd

  e = -a
  n = 1
  s = Math.sqrt(surd)

  n2 = 0
  n1 = 1
  ni = a

  d2 = 0
  d1 = 0
  di = 1

  # normalize
  c = Hash.new
  (0..100000).each do |i|
    # puts "a[#{i}]: #{a} e:#{e} n:#{n} ni:#{ni} di:#{di}"
    if !c.key? [a,e,n]
      c[[a,e,n]] = i
    else
      cycle = i - c[[a,e,n]]

      # puts "#{surd}: #{i} - #{c[[a,e,n]]} (#{cycle})"
      # break
    end


    d = (surd - e**2)
    r = Rational(n,d)
    n,d = r.numerator, r.denominator

    # puts "a: #{n} * (surd - #{e}) / #{d}"
    a = (n * (s - e) /d).floor
    e = -e - a*d

    n = d

    n1,n2 = ni,n1
    d1,d2 = di,d1

    ni = a * n1 + n2
    di = a * d1 + d2

    if ni**2 - surd * di**2 == 1
      # puts "D[#{surd}]: #{a} e:#{e} n:#{n} ni(x):#{ni} di:#{di}"

      puts "d:#{surd} min x:#{ni}"
      if ni > bestx
        bestx = ni
        bestd = surd
      end
      break
    end
  end
end

puts "bestd: #{bestd} bestx: #{bestx}"
