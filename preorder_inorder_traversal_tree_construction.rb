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
  return TreeNode.new(preorder.first) if preorder.size == 1 && inorder.size == 1

  parent_map = {}

  root_value = preorder.shift
  root = TreeNode.new(root_value)

  root_inorder_index = inorder.index(root.val)

  node_stack = [root]

  preorder_index = 0

  loop do
    current_node = node_stack.pop
    p '-' * 90
    p root, current_node, preorder_index
    p '-' * 90
    break unless current_node
    break if preorder_index == preorder.size
    current_node_inorder_index = inorder.index(current_node.val)

    node_value = preorder[preorder_index]
    value_inorder_index = inorder.index(node_value)

    p '*' * 90
    p current_node_inorder_index, value_inorder_index, node_value
    p '*' * 90
    if current_node_inorder_index > value_inorder_index
      # if parent_map[current_node.val]
      current_node.left = TreeNode.new(node_value)

      # node_stack.push(current_node)
      node_stack.push(current_node.left)

      parent_map[node_value] = current_node
      preorder_index += 1
    elsif current_node_inorder_index < value_inorder_index
      parent = parent_map[current_node.val]

      if parent && inorder.index(parent.val) < value_inorder_index
        # Add to right of parent
        if parent.right
          p 'Setting in right tree'
          node_stack.push(parent.right)
        else
          p 'SETTING PARENT RIGHT'
          # set to parent right
          parent.right = TreeNode.new(node_value)
          parent_map[node_value] = parent

          node_stack.push(parent.right)
          node_stack.push(current_node)
          preorder_index += 1
        end
      else
        # need to add to right of current
        if current_node.right
          node_stack.push(current_node.right)
        else
          # set to current right
          current_node.right = TreeNode.new(node_value)

          node_stack.push(current_node.right)
          parent_map[node_value] = current_node
          preorder_index += 1
        end
      end
    else
      # we are examining the current node somehow?
      p 'IN ELSE'
      node_stack.push(current_node.right)
    end
  end

  root
end

# p build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
# p build_tree([-1], [-1])
# p build_tree([1, 2], [1, 2])
p build_tree([1, 2, 3], [1, 2, 3])
