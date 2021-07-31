def min_jumps(nums)
  res = [0]

  (1...nums.size).each do |index|
    magnitude = nums[index - 1]
    max_index = [(index - 1) + magnitude, nums.size - 1].min
    (index..max_index).each do |sub|
      sub_val = res[sub]
      if sub_val.nil?
        res[sub] = res[index - 1] + 1
      end
    end
  end

  # p res
  res[-1]
end

p min_jumps([3, 4, 2, 1, 2, 3, 7, 1, 1, 1, 3]) # 4
# p min_jumps([1]) # 0
# p min_jumps([1, 1]) # 1
# p min_jumps([3, 1]) # 1
# p min_jumps([1, 1, 1]) # 2
# p min_jumps([2, 1, 1]) # 1
# p min_jumps([2, 1, 2, 3, 1]) # 2
# p min_jumps([2, 1, 2, 3, 1, 1, 1]) # 3
# p min_jumps([2, 1, 2, 2, 1, 1, 1]) # 4
# p min_jumps([3, 4, 2, 1, 2, 3, 7, 1, 1, 1, 3, 2, 6, 2, 1, 1, 1, 1]) # 5
# p min_jumps([3, 4, 2, 1, 2, 3, 7, 1, 1, 1, 3, 2, 3, 2, 1, 1, 1, 1]) # 7
# p min_jumps([3, 10, 2, 1, 2, 3, 7, 1, 1, 1, 3, 2, 3, 2, 1, 1, 1, 1]) # 6
# p min_jumps([3, 12, 2, 1, 2, 3, 7, 1, 1, 1, 3, 2, 3, 2, 1, 1, 1, 1]) # 5
# p min_jumps([3, 12, 2, 1, 2, 3, 15, 1, 1, 1, 3, 2, 3, 2, 1, 1, 1, 1]) # 3
