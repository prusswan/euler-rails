puts 5050 ** 2 - (1..100).inject{|sum, val| sum + val ** 2}
