OPERATORS = ['+', '-', '*', '/'].freeze

def calculate(s)
  return s.to_i if s.split(/[\+\-\*\/]/).length == 1

  pointer = 0

  exprs = []
  operator = nil
  # process input string
  while pointer < s.length
    token = s[pointer]
    if token == ' '
      # no-op
    elsif OPERATORS.include?(token) # this should be fine since all expressions are valid
      exprs.push(token)
    else
      num_str = ''
      while token.match?(/\d/)
        # p token, num_str, pointer
        num_str << token

        if pointer < s.length - 1
          pointer += 1
        else
          token = s[pointer]
          break
        end
        token = s[pointer]
      end

      pointer -= 1 if pointer != s.length - 1
      exprs.push(num_str.to_i)
    end

    pointer += 1
  end

  pointer = 0

  # process expressions with priority operators (*, /)
  loop do
    token = exprs[pointer]
    if priority?(token)
      a, operator, b = exprs[pointer-1..pointer+1]

      res = process_expression(a, b, operator)

      exprs[pointer-1..pointer+1] = res
      pointer -= 1
    end

    pointer += 1
    break if pointer == s.length
  end

  # process everything else
  pointer = 0
  loop do
    token = exprs[pointer]
    if OPERATORS.include?(token)
      a, operator, b = exprs[pointer-1..pointer+1]

      res = process_expression(a, b, operator)

      exprs[pointer-1..pointer+1] = res
      pointer -= 1
      # p exprs
    end

    pointer += 1
    break if pointer == s.length
  end

  # p exprs
  exprs.pop
end

def process_expression(a, b, operator)
  # b, a = nums
  # p b, a, operator

  case operator
  when '+'
    a + b
  when '-'
    a - b
  when '*'
    a * b
  when '/'
    a / b
  end
end

def priority?(token)
  return true if token == '*' || token == '/'

  false
end

p calculate("3+2*2") # 7

p calculate(" 3/2 ") # 1

p calculate(" 3+5 / 2 ") # 5

p calculate("42") # 42

p calculate("0-2147483647") # 

p calculate("1+1+1") # 3
