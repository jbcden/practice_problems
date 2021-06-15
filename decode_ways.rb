def num_decodings(s)
  return 0 if s[0] == '0'

  nums = s.split(//).map(&:to_i)

  if nums.size == 2
    if nums[0] == 2 && nums[1] < 7
      return 2
    elsif nums[0] == 1 && nums[1] > 0
      return 2
    elsif nums[0] == 1 && nums[1].zero?
      return 1
    end
  end

  index = 0
  choice_size = s.length
  choices_per_number = []

  while index < choice_size
    if index == choice_size - 1
      if nums[index].zero?
        choices_per_number[index] = 0
      else
        choices_per_number[index] = 1
      end
      index += 1

      next
    end

    current = nums[index]
    incoming = nums[index + 1]

    if current.zero?
      choices_per_number[index] = 0
      index += 1
      next
    end

    if current == 2
      if incoming < 7 && incoming > 0
        choices_per_number[index] = 2
      else
        choices_per_number[index] = 1
      end
    elsif current == 1 && incoming > 0
      choices_per_number[index] = 2
    else
      choices_per_number[index] = 1
    end

    index += 1
  end

  p choices_per_number

  permutations = 0
  choices_per_number.each_with_index do |number_of_choices, index|
    next if index == choice_size - 1
    return 0 if index == choice_size - 2 && number_of_choices == 1 && choices_per_number[index + 1]&.zero?
    # permutations += 1 if index == choice_size - 1 && number_of_choices == 1 && choices_per_number[index - 1] != 0
    next if number_of_choices.zero?
    # return 0 if number_of_choices == 1 && choices_per_number[index + 1]&.zero?
    # next if number_of_choices == 1
    next if index + 2 <= choice_size - 1 && choices_per_number[index + 2].zero?

    # p '*' * 90
    # p 'NANI??', index, number_of_choices
    # p '*' * 90
    if index + 2 >= choice_size
      # permutations += choices_per_number[-1]
      permutations += number_of_choices
    else
      permutations += 2
    end
  end

  permutations
end

# p num_decodings('12') # 2
# 
# p num_decodings('2260') # 0
# 
# p num_decodings('2210') # 2
# 
# p num_decodings('2126') # 5
# 
# p num_decodings('27234') # 2
# 
# p num_decodings('10') # 1
# 
# p num_decodings('2101') # 1

p num_decodings("1201234") # 3
