# frozen_string_literal: true

LETTERS_TO_NUMBERS = {
  'A' => 1,
  'B' => 2,
  'C' => 3,
  'D' => 4,
  'E' => 5,
  'F' => 6,
  'G' => 7,
  'H' => 8,
  'I' => 9,
  'J' => 10,
  'K' => 11,
  'L' => 12,
  'M' => 13,
  'N' => 14,
  'O' => 15,
  'P' => 16,
  'Q' => 17,
  'R' => 18,
  'S' => 19,
  'T' => 20,
  'U' => 21,
  'V' => 22,
  'W' => 23,
  'X' => 24,
  'Y' => 25,
  'Z' => 26
}.freeze

def title_to_number(column_title)
  magnitude = column_title.size - 1
  sum = 0
  column_title.split(//).each do |letter|
    sum += (26**magnitude) * LETTERS_TO_NUMBERS[letter]

    magnitude -= 1
  end

  sum
end
p title_to_number('FXSHRXW')
