def max_area(heights)
  left = 0
  right = heights.size - 1

  min_height = [heights[left], heights[right]].min
  distance = right - left

  max_area = min_height * distance

  loop do
    if heights[left] < heights[right]
      left += 1
      tmp_min_height = [heights[left], heights[right]].min
      tmp_distance = right - left

      tmp_area = tmp_min_height * tmp_distance

      max_area = tmp_area if tmp_area > max_area
    else
      right -= 1
      tmp_min_height = [heights[left], heights[right]].min
      tmp_distance = right - left

      tmp_area = tmp_min_height * tmp_distance

      max_area = tmp_area if tmp_area > max_area
    end

    break if right == left
  end

  max_area
end

p max_area([1, 8, 6, 2, 5, 4, 8, 3, 7]) # 49

p max_area([1, 1]) # 1

p max_area([4, 3, 2, 1, 4]) # 16

p max_area([1, 2, 1]) # 2

p max_area([1, 2, 4, 3]) # 4

p max_area([2, 3, 10, 5, 7, 8, 9]) # 36

p max_area([2, 3, 4, 5, 18, 17, 6]) # 17

p max_area([8, 20, 1, 2, 3, 4, 5, 6]) # 42
