class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def self.from_list(arr, node: nil)
    return if arr.empty?

    if node.nil?
      root = TreeNode.new(arr.shift)
      left = arr.shift
      right = arr.shift

      root.left = TreeNode.new(left) if left
      root.right = TreeNode.new(right) if right

      from_list(arr, node: root.left) if left
      from_list(arr, node: root.right) if right
    else
      left = arr.shift
      right = arr.shift

      node.left = TreeNode.new(left) if left
      node.right = TreeNode.new(right) if right

      from_list(arr, node: node.left) if left
      from_list(arr, node: node.right) if right
    end

    root
  end
end

def zigzag_level_order(root, res = [], level = 0)
  return [] unless root

  new_res = []
  new_res[level] = [root.val]

  next_level = level + 1
  if next_level.odd?
    right = zigzag_level_order(root.right, res, next_level)
    left = zigzag_level_order(root.left, res, next_level)
  else
    left = zigzag_level_order(root.left, res, next_level)
    right = zigzag_level_order(root.right, res, next_level)
  end

  size = [left.size, right.size].max
  (next_level..size).each do |current_level|
    next if (right[current_level].nil? || right[current_level].empty?) && (left[current_level].nil? || left[current_level].empty?)

    if current_level.even?
      new_res[current_level] = [left[current_level], right[current_level]].compact.flatten
    else
      new_res[current_level] = [right[current_level], left[current_level]].compact.flatten
    end
  end

  new_res
end

# p zigzag_level_order(TreeNode.from_list([3, 9, 20, nil, nil, 15, 7])) # [[3], [20, 9], [15, 7]]
# p zigzag_level_order(TreeNode.from_list([1,2])) # [[1], [2]]
# 
# p zigzag_level_order(TreeNode.from_list([1])) # [[1]]
# 
# p zigzag_level_order(TreeNode.from_list([])) # []

# root = TreeNode.from_list([1,2,3,4,nil,nil,5])
root = TreeNode.new(1, TreeNode.new(2, TreeNode.new(4)), TreeNode.new(3, nil, TreeNode.new(5)))
# #p root
p zigzag_level_order(root) # []
