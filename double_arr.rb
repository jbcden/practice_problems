def double_array(arr)
  _double_arr(arr, arr.size - 1)
end

def _double_arr(arr, index)
  return arr if index < 0

  arr[index] *= 2

  _double_arr(arr, index - 1)
end

p double_array([2, 3, 5, 8, 20]) # [4, 6, 10, 16, 40]
