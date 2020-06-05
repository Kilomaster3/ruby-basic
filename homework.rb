def validate(key)
  String(key).split('') 
             .reverse 
             .each_with_index
             .map { |x, i| i.odd? and x.to_i * 2 or x.to_i }
             .map { |x| x.to_s.length > 1 ? x.to_s.split('').map(&:to_i).reduce(:+) : x } 
             .reduce(:+) % 10 == 0 
end
