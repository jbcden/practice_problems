require 'bigdecimal'

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

def min_diff_in_bst(root)
    @min = nil
    @prev = nil
    rec(root)
    @min
end

def rec(root)
    return if root.nil?
    rec(root.left)
    # p '*' * 90
    # p root.val, @prev
    # p root.val
    p @prev
    # p '*' * 90
    val = root.val - @prev if @prev
    if val
      @min = val if @min.nil?
      @min  = val if val < @min
    end
    @prev = root.val
    rec(root.right)
    # p '-' * 90
    # p root.val, @prev
    # p root.val
    p @prev
    # p '-' * 90
end

# root = TreeNode.from_list([4, 2, 6, 1, 3])
# p root
# p min_diff_in_bst(root) # 1
root = TreeNode.from_list([56,42,77,23,51,75,90,nil,nil,nil,nil,67,nil,78,99])
p root
p min_diff_in_bst(root) # 1
