def find_peak_element(nums)
  return 0 if nums.size == 1
  if nums.size == 2 && nums[0] > nums[1]
    return 0
  elsif nums.size == 2 && nums[1] > nums[0]
    return 1
  end

  max = nums.size
  mid = max / 2

  return mid if peak?(nums, mid)

  left_arr = [-9999999999999999] + nums[0..mid]
  left = binary_seach(left_arr, -1)
  #p 'LEFT', left_arr
  #p 'LEFT', left
  right_arr = nums[mid..] + [-9999999999999999]
  right = binary_seach(right_arr, mid)

  return left if left >= 0
  return right if right >= 0
end

def binary_seach(nums, offset = 0, peak = -1)
  # p nums
  return peak if nums.size <= 2

  max = nums.size
  min = 0
  mid = (max + min) / 2

  if peak?(nums, mid)
    # p 'PEAK FOUND', nums, mid, offset
    peak = mid + offset
  else
    left = binary_seach(nums[0..mid], offset, peak)
    peak = left if left >= 0
    right = binary_seach(nums[mid..], (offset + mid), peak)
    peak = right if right >= 0
  end

  peak
end

def peak?(nums, candidate)
  # p nums, candidate
  nums[candidate] > nums[candidate - 1] && nums[candidate] > nums[candidate + 1]
end

p find_peak_element([1, 2, 3, 1]) # 2
p find_peak_element([1, 2, 1, 3, 5, 6, 4]) # 1 or 5
p find_peak_element([2, 1]) # 0
p find_peak_element([1, 2]) # 1
p find_peak_element([3, 2, 1]) # 0
p find_peak_element([1, 2, 3]) # 2
p find_peak_element([4, 3, 2, 1]) # 0
p find_peak_element([1, 2, 3, 4, 3]) # 3
p find_peak_element([2, 3, 4, 3, 2, 1]) # 2
p find_peak_element([6, 5, 4, 3, 2, 1]) # 0
p find_peak_element([1, 2, 3, 4, 5, 6, 7]) # 6
