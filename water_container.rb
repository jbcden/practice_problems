def max_area(heights)
  left_max_so_far = 0
  start = 0

  end_point = heights.size - 1

  mid_point = (heights.size / 2) - 1
  min_height = heights[0]

  distance = end_point - left_max_so_far
  while start < end_point - 1 # <= mid_point
    if heights[start] > heights[left_max_so_far]
      new_min_height = heights[start]
      min_height_delta = new_min_height - min_height

      new_distance = end_point - start
      distance_delta = distance - new_distance

      old_ratio = (min_height - distance).abs
      new_ratio = (new_min_height - new_distance).abs

      if min_height_delta - distance_delta >= 0 || new_ratio < old_ratio
        left_max_so_far = start
        min_height = new_min_height
        distance = end_point - left_max_so_far
      end

    end
    start += 1
  end

  min_height = heights[left_max_so_far]
  distance = end_point - left_max_so_far
  right_max_so_far = end_point

  while end_point > left_max_so_far
    if heights[end_point] > heights[right_max_so_far]
      new_min_height = [heights[end_point], min_height].min
      min_height_delta = (new_min_height - min_height).abs#BAD?

      new_distance = end_point - left_max_so_far
      distance_delta = distance - new_distance

      if min_height_delta - distance_delta >= 0
        right_max_so_far = end_point
        min_height = new_min_height
        distance = right_max_so_far - left_max_so_far
      end

    end
    end_point -= 1
  end

  min_height = [heights[left_max_so_far], heights[right_max_so_far]].min
  distance * min_height
end

# p max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]) # 49
# 
# p max_area([1, 1]) # 1
# 
# p max_area([4, 3, 2, 1, 4]) # 16
# 
# p max_area([1, 2, 1]) # 2
# 
# p max_area([1, 2, 4, 3]) # 4
# 
# p max_area([2, 3, 10, 5, 7, 8, 9]) # 36
# 
# p max_area([2, 3, 4, 5, 18, 17, 6]) # 17

p max_area([8, 20, 1, 2, 3, 4, 5, 6]) # 42
