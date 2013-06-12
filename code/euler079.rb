input = %Q{
  319
  680
  180
  690
  129
  620
  762
  689
  762
  318
  368
  710
  720
  710
  629
  168
  160
  689
  716
  731
  736
  729
  316
  729
  729
  710
  769
  290
  719
  680
  318
  389
  162
  289
  162
  718
  729
  319
  790
  680
  890
  362
  319
  760
  316
  729
  380
  319
  728
  716
}

i = input.strip.split(/\s*\n\s*/).uniq

"01236789".split('').permutation.each do |e|
  s = e.join
  # puts s
  found = true
  i.each do |k|
    unless s =~ /#{k[0]}.*#{k[1]}.*#{k[2]}/
      found = false
      break
    end
  end

  if found == true
    puts s
    break
  end
end
