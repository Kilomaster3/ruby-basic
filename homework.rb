def validate(key)
  digits = String(key).reverse.chars.map(&:to_i)
  digits.each_with_index.reduce(0) do |acc, (value, index)|
    acc + if index.even?
            value
          else
            double_value = value * 2
            if double_value > 9
              double_value.to_s.split('').map(&:to_i).reduce(&:+)
            else
              double_value
            end
          end
  end % 10 == 0
end
