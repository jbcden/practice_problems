# frozen_string_literal: true
require 'set'

def length_of_longest_substring(s)
  return 0 if s == ""

  max = 0
  max_so_far = 0
  chars = s.split(//)
  chars_so_far = Set.new
  length = s.length - 1
  starting_index = 0
  current_index = 0

  loop do
    char = chars[current_index]
    puts "CHAR: #{char}"
    if chars_so_far.include?(char)
      p 'DUP CHAR', max_so_far
      max = max_so_far if max_so_far > max
      max_so_far = 0
      chars_so_far.clear
      starting_index += 1
      current_index = starting_index
      next
    else
      p 'NON-DUP'
      chars_so_far << char
      max_so_far += 1
    end

    break if current_index == length
    current_index += 1
  end

  [max, max_so_far].max
end

s = "dvdf"
# s = ""
# s = " "
# s = "abcabcbb"
# s = "bbbbb"
# s = "pwwkew"
p length_of_longest_substring(s)
