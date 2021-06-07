# Definition for a binary tree node.
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

      node.left = TreeNode.new(left) if left
      node.right = TreeNode.new(right) if right

      from_list(arr, node: node.left) if left
      from_list(arr, node: node.right) if right
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

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?

  _level_order(root, [], 0)
end

def _level_order(node, list, level)
  list[level] ||= []
  list[level] << node.val

  _level_order(node.left, list, level + 1) if node.left
  _level_order(node.right, list, level + 1) if node.right

  list
end

# list = [1]
# root = TreeNode.from_list(list)
# p level_order(root)

list = [3, 9, 20, nil, nil, 15, 7]
root = TreeNode.from_list(list)
p level_order(root)
