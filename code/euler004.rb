candidates = (100..999).map{ |e| (100..999).collect{ |e2| e2 * e}.uniq }.flatten.uniq.sort.reverse
puts candidates.select{|e| e.to_s.reverse == e.to_s}.take(1)
