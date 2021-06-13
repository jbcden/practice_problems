require 'set'

def four_sum_count(nums1, nums2, nums3, nums4)
  sums = Set.new
  # size is the same for all arrays
  n = nums1.size
  # index for nums2
  j = 0
  # index for nums3
  k = 0
  # index for nums4
  l = 0

  while j < n
    while k < n
      while l < n
        sums << nums2[j] + nums3[k] + nums4[l]
        l += 1
      end
      k += 1
      l = 0
    end
    j += 1
    k = 0
    l = 0
  end

  p sums
  count = 0
  nums1.each do |number|
    opposite = 0 - number
    count += 1 if sums.include?(opposite)
  end

  count
end

# p four_sum_count([1, 2], [-2, -1], [-1, 2], [0, 2]) # 2
# 
# p four_sum_count([0], [0], [0], [0]) # 1

nums1 = [-1, -1]
nums2 = [-1, 1]
nums3 = [-1, 1]
nums4 = [1, -1]
p four_sum_count(nums1, nums2, nums3, nums4) # 6
