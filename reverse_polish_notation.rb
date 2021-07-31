require 'set'

OPERATORS = Set.new(['+', '-', '*', '/']).freeze

def eval_rpn(tokens)
  index = 0
  while index < tokens.size
    # p index
    unless OPERATORS.include?(tokens[index])
      index += 1
      next
    end

    first = tokens[index - 2].to_i
    second = tokens[index - 1].to_i
    operator = tokens[index]
    res = process_expression(first, second, operator)
    # puts "EXPR: #{first} #{operator} #{second} = #{res}"

    tokens[index - 2..index] = res
    index -= 1
  end

  tokens[0].to_i
end

def process_expression(first, second, operator)
  case operator
  when '+'
    first + second
  when '-'
    first - second
  when '*'
    first * second
  when '/'
    if first < 0
      first_sign = -1
    else
      first_sign = 1
    end
    if second < 0
      second_sign = -1
    else
      second_sign = 1
    end

    if first.abs < second.abs
      0
    else
      res = first.abs / second.abs
      res * first_sign * second_sign
    end
  end
end

# p eval_rpn(['2', '1', '+', '3', '*']) # 9
# p eval_rpn(['4', '13', '5', '/', '+']) # 6
# p eval_rpn(['10', '6', '9', '3', '+', '-11', '*', '/', '*', '17', '+', '5', '+']) # 22
p eval_rpn(['-78', '-33', '196', '+', '-19', '-', '115', '+', '-', '-99', '/', '-18', '8', '*', '-86', '-', '-', '16', '/', '26', '-14', '-', '-', '47', '-', '101', '-', '163', '*', '143', '-', '0', '-', '171', '+', '120', '*', '-60', '+', '156', '/', '173', '/', '-24', '11', '+', '21', '/', '*', '44', '*', '180', '70', '-40', '-', '*', '86', '132', '-84', '+', '*', '-', '38', '/', '/', '21', '28', '/', '+', '83', '/', '-31', '156', '-', '+', '28', '/', '95', '-', '120', '+', '8', '*', '90', '-', '-94', '*', '-73', '/', '-62', '/', '93', '*', '196', '-', '-59', '+', '187', '-', '143', '/', '-79', '-89', '+', '-']) # 165
