require 'set'

def contains_duplicate(nums)
  cache = Set.new

  nums.each do |n|
    return true if cache.include?(n)

    cache << n
  end

  false
end
