count = 0

(1..10000).each do |surd|
  # surd = 23

  a = Math.sqrt(surd).floor
  next if a**2 == surd

  e = -a
  n = 1
  s = Math.sqrt(surd)

  # normalize
  c = Hash.new
  (0..1000000).each do |i|
    # puts "a[#{i}]: #{a} e:#{e} n:#{n}"
    if !c.key? [a,e,n]
      c[[a,e,n]] = i
    else
      cycle = i - c[[a,e,n]]

      if cycle%2 != 0
        puts "#{surd}: #{i} - #{c[[a,e,n]]} (#{cycle})"
        count += 1
      end
      break
    end


    d = (surd - e**2)
    r = Rational(n,d)
    n,d = r.numerator, r.denominator

    # puts "a: #{n} * (surd - #{e}) / #{d}"
    a = (n * (s - e) /d).floor
    e = -e - a*d

    n = d
  end
end

puts count
