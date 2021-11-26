# https://leetcode.com/problems/string-to-integer-atoi/

def my_atoi(s)
  stripped = s.strip
  negative = if stripped[0] == '-'
               stripped = stripped[1..]
               true
             elsif stripped[0] == '+'
               stripped = stripped[1..]
               false
             else
               false
             end

  final_str = ''
  stripped.each_char do |char|
    break if char.ord < '0'.ord || char.ord > '9'.ord

    final_str << char
  end

  if final_str.nil?
    0
  else
    reversed = final_str.reverse

    res = 0
    magnitude = 0

    reversed.each_char do |char|
      res += 10**magnitude * (char.ord - '0'.ord)

      magnitude += 1
    end

    res = res * -1 if negative

    if negative
      [res, -2**31].max
    else
      [res, 2**31 - 1].min
    end
  end
end

# TODO: clamp MAX / MIN values

#p my_atoi('42') # 42
#p my_atoi('-42') # -42
#p my_atoi('4193 with words') # 4139
#p my_atoi('-91283472332') # -2147483648
#p my_atoi('     -42') # -42
p my_atoi('21474836460') # 2147483647

