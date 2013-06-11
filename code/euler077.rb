# variation of p31 DP solution

require 'prime'
k = 25

p = Prime.take(k)
a = (1..201).map { Array.new(k,0) }

max = 0

(1..200).each do |n|
  (0..k-1).each do |i|
    if (n-p[i] >= 0) # if coin can be used
      # A: combinations using smaller coins
      # B: combinations (n-coin) that already uses this coin
      a[n][i] = a[n][i-1] + a[n-p[i]][i]

      # C: n == p
      a[n][i] += 1 if n == p[i]
    else
      a[n][i] = a[n][i-1]  # no difference from using smaller coins
    end
  end

  if a[n][k-1] > 5000
    max = a[n][k-1]
    puts "n: #{n} max: #{max}"
    break
  end
end
