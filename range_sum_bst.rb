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

def range_sum_bst(root, low, high)
  @sum = 0

  _range_sum_bst(root, low, high)

  @sum
end

def _range_sum_bst(root, low, high)
  return @sum unless root

  _range_sum_bst(root.left, low, high)

  if root.val >= low && root.val <= high
    @sum =  @sum + root.val
  end

  _range_sum_bst(root.right, low, high)
end

root = TreeNode.from_list([10,5,15,3,7,nil,18])
p range_sum_bst(root, 7, 15) # 32
