def num_decodings(s)
  return 0 if s[0] == '0'
  return 1 if s.size == 1

  nums = s.split(//).map(&:to_i)

  choice_size = s.length
  first, second = nums[0..1]
  if first == 1 && second > 0 || (first == 2 && second < 7 && second > 0)
    choices_at_each_index = [1, 2]
  elsif first > 2 && second.zero?
    return 0
  else
    choices_at_each_index = [1, 1]
  end

  return choices_at_each_index[1] if nums.size == 2
  nums_index = 2
  choices_index = 2

  # cases:
  # 1. combinable: add two previous
  # 2. non-combinable: 1
  # 4. 0: value of (index - 2)
  while nums_index < choice_size
    current_number = nums[nums_index]
    previous_number = nums[nums_index - 1]

    if current_number.zero? && (previous_number != 1 && previous_number != 2)
      return 0
    elsif current_number.zero?
      choices_at_each_index[choices_index] = choices_at_each_index[choices_index - 2]
    elsif previous_number == 1 || (previous_number == 2 && current_number < 7)
      choices_at_each_index[choices_index] = choices_at_each_index[choices_index - 1] + choices_at_each_index[choices_index - 2]
    else
      choices_at_each_index[choices_index] = choices_at_each_index[choices_index - 1]
    end

    nums_index += 1
    choices_index += 1
  end

  choices_at_each_index[choice_size - 1]
end

p num_decodings('12') # 2

p num_decodings('2260') # 0

p num_decodings('2210') # 2

p num_decodings('2126') # 5

p num_decodings('27234') # 2

p num_decodings('10') # 1

p num_decodings('2101') # 1

p num_decodings('1201234') # 3

p num_decodings('207') # 1

p num_decodings('2611055971756562') # 4

p num_decodings('301') # 0
