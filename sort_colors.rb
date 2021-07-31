# red = 0
# white = 1
# blue = 2
def sort_colors(nums)
  num_red = 0
  num_white = 0
  num_blue = 0

  nums.each do |n|
    num_red += 1 if n == 0
    num_white += 1 if n == 1
    num_blue += 1 if n == 2
  end

  current_index = 0
  while num_red > 0 || num_white > 0 || num_blue > 0
    if num_red > 0
      nums[current_index] = 0
      num_red -= 1
    elsif num_red == 0 && num_white > 0
      nums[current_index] = 1
      num_white -= 1
    elsif num_red == 0 && num_white == 0 && num_blue > 0
      nums[current_index] = 2
      num_blue -= 1
    end

    current_index += 1
  end
end

nums = [2, 0, 2, 1, 1, 0]
sort_colors(nums)
p nums
