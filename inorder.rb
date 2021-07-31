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

def inorder_traversal(root, cache=[])
  return [] unless root

  if root.left
    inorder_traversal(root.left, cache)
  end

  cache.push(root.val)

  if root.right
    inorder_traversal(root.right, cache)
  end


  cache
end

p inorder_traversal(TreeNode.from_list([1, nil, 2, 3]))
