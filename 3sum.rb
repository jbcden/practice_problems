require 'set'

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  return [] if nums.empty? || nums.size < 3

  high = nums.size - 1
  low = 0
  sums_map = {}
  # res = Set.new
  res = []

  c = 0
  while low < nums.size - 1 do
    sum = nums[low] + nums[high]
    val_cache = sums_map.fetch(sum, [])
    val_cache << [low, high]
    sums_map[sum] = val_cache

    high -= 1

    if high == low
      # p 'TESTING', high, low, sums_map
      low += 1
      high = nums.size - 1
    end
  end

  nums.each_with_index do |num, index|
    sums_map[-num]&.each do |pair|

      next if pair.include?(index)
      # p '*' * 90 if pair.include?(4)
      # p index if pair.include?(4)
      # p pair if pair.include?(4)
      # p '*' * 90 if pair.include?(4)

      res << (pair.map { |idx| nums[idx] } + [num]).sort
    end
  end
  p res.to_a
  p sums_map
  # res.to_a
  res
end

# raise 'Empty example' unless three_sum([]) == []
#
# raise 'Zero example' unless three_sum([0]) == []

p 'First real example' unless three_sum([-1, 0, 1, 2, -1, -4]) == [[-1, -1, 2], [-1, 0, 1]]

# p 'Second real example' unless three_sum([3,0,-2,-1,1,2]) == [[-2,-1,3],[-2,0,2],[-1,0,1]]

long=[12,13,12,13,-3,3,11,7,10,5,1,6,6,14,2,-8,-1,-4,3,-10,3,-13,7,-15,12,10,-2,-14,3,-3,-7,0,-12,12,-1,0,0,-13,-8,-12,7,0,9,-1,-8,-12,6,6,-1,-13,3,-13,-11,-4,9,-14,-9,14,9,2,-3,-13,9,0,-15,-15,7,-8,-12,6,-5,10,14,-11,-6,-9,14,8,4,-10,10,-8,14,6,3,8,0,2,8,-6,11,12,-3,5,-3,-11,6,11,-4,1,-6,-1,-4,-7,3,-2,-9,-5,-9,10,0,8,-12,-8,-1]

# FIXME: time to beat is 0.696s
# p three_sum(long)
