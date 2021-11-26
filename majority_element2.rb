# https://leetcode.com/problems/majority-element-ii/
def majority_element(nums)
  size = nums.size
  cache = Hash.new(0)
  res = []

  nums.each do |n|
    count = cache[n]
    cache[n] = count + 1
  end

  cache.each do |n, count|
    res << n if count > size / 3
  end

  res
end

p majority_element([3, 2, 3]) # [3]
p majority_element([1]) # [1]
p majority_element([1, 2]) # [1, 2]
