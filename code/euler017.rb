def ones(n)
  case n
  when 1
    'one'
  when 2
    'two'
  when 3
    'three'
  when 4
    'four'
  when 5
    'five'
  when 6
    'six'
  when 7
    'seven'
  when 8
    'eight'
  when 9
    'nine'
  when 10
    'ten'
  when 11
    'eleven'
  when 12
    'twelve'
  when 13
    'thirteen'
  when 14
    'fourteen'
  when 15
    'fifteen'
  when 16
    'sixteen'
  when 17
    'seventeen'
  when 18
    'eighteen'
  when 19
    'nineteen'
  when 20
    'twenty'
  when 30
    'thirty'
  when 40
    'forty'
  when 50
    'fifty'
  when 60
    'sixty'
  when 70
    'seventy'
  when 80
    'eighty'
  when 90
    'ninety'
  when 100
    'one hundred'
  when 1000
    'one thousand'
  when 0
    ''
  else
    'undefined'
  end
end

def letters(n)
  if (21..99).include? n
    "#{ones(n/10 * 10)} #{ones(n%10)}"
  elsif (101..999).include? n
    if n%100 == 0
      "#{ones(n/100)} hundred"
    else
      "#{ones(n/100)} hundred and #{letters(n%100)}"
    end
  else
    ones(n)
  end
end

puts (1..1000).map { |c| puts letters(c); letters(c).gsub(/\s/,'').length }.inject(:+)
