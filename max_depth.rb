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

def max_depth(root)
  return 0 unless root

  left_depth = max_depth(root.left) + 1
  right_depth = max_depth(root.right) + 1

  [left_depth, right_depth].max
end

p max_depth(TreeNode.from_list([3,9,20,nil,nil,15,7])) # 3
p max_depth(TreeNode.from_list([1,nil,2])) # 2
