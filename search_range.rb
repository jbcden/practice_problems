def search_range(nums, target)
  return [-1, -1] if nums.empty?
  return [0, 0] if nums.size == 1 && nums[0] == target

  max_target_index = -1

  min_target_index = binary_search(nums, target)
  return [-1, -1] if min_target_index == -1

  found_at = min_target_index
  while found_at > 0
    found_at = binary_search(nums[0..found_at - 1], target)
    break if found_at == -1

    if found_at < min_target_index
      max_target_index = min_target_index if min_target_index > max_target_index
      min_target_index = found_at
    end

    break if found_at == 0
  end

  max_target_index = min_target_index if min_target_index > max_target_index
  if min_target_index > 0
    found_at = min_target_index
  else
    found_at = 0
  end
  while found_at <= nums.size - 1
    found_at = binary_search(nums[found_at + 1..], target, found_at + 1)
    break if found_at == -1

    if found_at > max_target_index
      max_target_index = found_at
    end
  end

  [min_target_index, max_target_index]
end

def binary_search(arr, target, offset = 0)
  max = arr.length - 1
  min = 0

  while min <= max #know that if the size difference between the min and the max is 0 or negative, we've gone through the whole array and did not find the element
    mid = (min + max) / 2
    if arr[mid] == target
      return mid + offset
    elsif arr[mid] > target #if the mid is greater than element looking for, discount right side and focus on left
      max = mid - 1
    else #covers remaining logic, if mid is less than element looking for, discount left and focus on right
      min = mid + 1
    end
  end

  -1
end

# p binary_search([8, 10], 8) # [3, 4]
# p binary_search([5, 7, 7, 8, 8, 10], 8) # [3, 4]
p search_range([5, 7, 7, 8, 8, 10], 8) # [3, 4]
p search_range([5, 7, 7, 8, 8, 10], 6) # [-1, -1]
p search_range([], 0) # [-1, -1]
p search_range([1], 1) # [0, 0]
p search_range([5, 7, 7, 8, 10], 8) # [3, 3]
p search_range([2, 2], 2) # [0, 1]
p search_range([1, 3], 1) # [0, 0]
