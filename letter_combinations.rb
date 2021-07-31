NUM_LETTER_MAP = {
  2 => ['a', 'b', 'c'],
  3 => ['d', 'e', 'f'],
  4 => ['g', 'h', 'i'],
  5 => ['j', 'k', 'l'],
  6 => ['m', 'n', 'o'],
  7 => ['p', 'q', 'r', 's'],
  8 => ['t', 'u', 'v'],
  9 => ['w', 'x', 'y', 'z']
}

def letter_combinations(digits)
  return [] if digits.empty?
  return NUM_LETTER_MAP[digits.to_i] if digits.length == 1

  res = []

  digit = digits[-1]
  letters = NUM_LETTER_MAP[digit.to_i]

  combos = letter_combinations(digits[0..-2])

  letters.each do |letter|
    combos.each do |combo|
      res << (combo + letter)
    end
  end

  res
end

p letter_combinations('23') # ["ad","ae","af","bd","be","bf","cd","ce","cf"]
p letter_combinations('') # []
p letter_combinations('2') # ['a', 'b', 'c']
