def max_sub_array(nums)
  max_so_far = nums[0]
  arr = [nums[0]]

  (1...nums.size).each do |index|
    if nums[index] + arr[index - 1] > nums[index]
      sum = nums[index] + arr[index - 1]
      arr[index] = sum
      max_so_far = sum if sum > max_so_far
    else
      num = nums[index]
      arr[index] = num
      max_so_far = num if num > max_so_far
    end
  end

  max_so_far
end

p max_sub_array([-2, 1, -3, 4, -1, 2, 1, -5, 4]) # 6
p max_sub_array([1]) # 1
p max_sub_array([5, 4, -1, 7, 8]) # 23
