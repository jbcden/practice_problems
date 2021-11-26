def intersect(nums1, nums2)
  nums1.sort!
  nums2.sort!

  pointer1 = 0
  pointer2 = 0

  res = []

  while !nums1[pointer1].nil? && !nums2[pointer2].nil?
    if nums1[pointer1] < nums2[pointer2]
      pointer1 += 1
    elsif nums1[pointer1] > nums2[pointer2]
      pointer2 += 1
    else
      res << nums1[pointer1]

      pointer1 += 1
      pointer2 += 1
    end
  end

  res
end

p intersect([1, 2, 2, 1], [2, 2]) # [2, 2]
p intersect([4, 9, 5], [9, 4, 9, 8, 4]) # [9, 4]
