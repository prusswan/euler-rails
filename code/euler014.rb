$memo = Hash.new
$memo[1] = 1

def collatz(n)
  if n%2 == 0
    n/2
  else
    3*n +1
  end
end

## Attempt 1: Memoization

def compute(n)
  if $memo[n].nil?
    if $memo[collatz(n)].nil?
      compute(collatz(n))
    end
    $memo[n] = $memo[collatz(n)] + 1
  end

  $memo[n]
end

# result = $memo.each_pair.inject(1) {|v,p| ((p.last > $memo[v]) and p.first < 1000000) ? p.first : v }
# puts result


## Attempt 1: (improved)
step = (2...1000000).map { |c| compute(c) }.max
puts $memo.key(step)


# Attempt 2: Bruteforce!!

# chain = Hash.new

# bruteforce = (2...1000000).map do |s|
#   i = 1
#   # n = 56991483520
#   n = s
#   while n != 1
#     n = collatz(n)
#     i+=1
#   end
#   chain[i] = s
#   i
# end

# # puts bruteforce.size
# result = bruteforce.max

# puts "#{result}, #{chain[result]}"
