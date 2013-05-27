puts (1...1000).select { |c| c if c%5==0 or c%3==0 }.inject{|sum,x| sum + x}
