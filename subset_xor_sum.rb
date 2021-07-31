def subset_xor_sum(nums)
  _subset_xor_sum(nums).sum
end

def _subset_xor_sum(nums)
  return [] if nums.empty?
  return nums if nums.size == 1

  res = []

  n = nums.pop
  res.push(n)

  ns = _subset_xor_sum(nums)

  ns.each do |num|
    res.push(num)
    xored = num ^ n
    res.push(xored)
  end

  res
end

p subset_xor_sum([1,3]) # 6

p subset_xor_sum([5, 1, 6]) # 28
