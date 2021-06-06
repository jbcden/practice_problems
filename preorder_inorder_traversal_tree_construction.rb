# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  unless inorder.empty?
    root_value = preorder.shift
    root = TreeNode.new(root_value)
    root_index = inorder.index(root.val)

    root.left = build_tree(preorder, inorder[0...root_index])
    root.right = build_tree(preorder, inorder[(root_index + 1)..])

    return root
  end
end

# p build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
# p build_tree([-1], [-1])
# p build_tree([1, 2], [1, 2])
# p build_tree([1, 2, 3], [1, 2, 3])
# p build_tree([3, 1, 2, 4], [1, 2, 3, 4])
# p build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])

def post_build_tree(inorder, postorder)
  unless inorder.empty?
    root_value = postorder.pop
    root = TreeNode.new(root_value)
    root_index = inorder.index(root_value)

    # p root, postorder, inorder[(root_index + 1)..]
    root.right = post_build_tree(inorder[(root_index + 1)..], postorder)
    # p root, postorder, inorder[0...root_index]
    root.left = post_build_tree(inorder[0...root_index], postorder)

    return root
  end
end

p post_build_tree([9, 3, 15, 20, 7], [9, 15, 7, 20, 3])
