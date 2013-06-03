tri = (45..140).map do |n|
  s = n * (n+1)/2
end.select {|e| e.to_s[2] != '0'}.map(&:to_s)

sq = (32..99).map do |n|
  s = n ** 2
end.select {|e| e.to_s[2] != '0'}.map(&:to_s)

pen = (26..81).map do |n|
  s = n * (3*n - 1)/2
end.select {|e| e.to_s[2] != '0'}.map(&:to_s)

hex = (23..70).map do |n|
  s = n * (2*n - 1)
end.select {|e| e.to_s[2] != '0'}.map(&:to_s)

hep = (21..63).map do |n|
  s = n * (5*n - 3 ) / 2
end.select {|e| e.to_s[2] != '0'}.map(&:to_s)

oct = (19..58).map do |n|
  s = n * (3*n - 2)
  # break if s >= 10000

  # if s >= 1000
  #   puts n
  # end

  s
end.select {|e| e.to_s[2] != '0'}.map(&:to_s)

r = [tri,sq,pen,hex,hep,oct]

(0..5).to_a.permutation.each do |p|
  s = p.map{|i| r[i]}
  s[0].each do |a|
    s[1].select{|e| e.start_with? a[-2..-1]}.each do |b|
      s[2].select{|e| e.start_with? b[-2..-1]}.each do |c|
        s[3].select{|e| e.start_with? c[-2..-1]}.each do |d|
          s[4].select{|h| h.start_with? d[-2..-1]}.each do |e|
            s[5].select{|h| h.start_with? e[-2..-1]}.each do |f|
              next unless a.start_with? f[-2..-1]
              sum = [a, b, c, d, e, f].map(&:to_i).inject(:+)
              puts "#{a}|#{b}|#{c}|#{d}|#{e}|#{f} #{sum}"
            end
          end
        end
      end
    end
  end
end
# puts tri
# puts sq
# puts pen
# puts hex
# puts hep
# puts oct
