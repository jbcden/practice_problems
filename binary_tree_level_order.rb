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

  _level_order([root], [])
end

def _level_order(level_nodes, list)
  return [] if level_nodes.empty?

  if list.empty?
    node = level_nodes.pop
    list << [node.val]

    _level_order([node.left, node.right].compact, list)
  else
    # p list
    vals = level_nodes.map { |node| node&.val }.compact
    list << vals
    # p list

    nodes = level_nodes.map { |node| [node&.left, node&.right] }.flatten.compact
    _level_order(nodes, list)
  end

  list
end

list = [1]
root = TreeNode.from_list(list)
p root

p level_order(root)
