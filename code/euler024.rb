puts (0..9).to_a.permutation.each_with_index.select{ |e,i| i == 999999 }.first.first.join('')
