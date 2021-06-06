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

  preorder.each do |node_value|
    current_node = node_stack.pop
    current_node_inorder_index = inorder.index(current_node.val)
    value_inorder_index = inorder.index(node_value)

    if current_node_inorder_index > value_inorder_index
      current_node.left = TreeNode.new(node_value)
      node_stack.push(current_node)
      node_stack.push(current_node.left)
    elsif current_node_inorder_index < value_inorder_index
      if root_inorder_index < value_inorder_index
        right_node = root.right
        if right_node
          while right_node
            right_node_index = inorder.index(right_node.val)
            if right_node_index > current_node_inorder_index
              if right_node.left
                right_node = right_node.left
              else
                # Add as left
                right_node.left = TreeNode.new(node_value)
                break # go back to main loop
              end
            else
              if right_node.right
                right_node = right_node.right
              else
                # Add as left
                right_node.right = TreeNode.new(node_value)
                node_stack.push(right_node)
                break # go back to main loop
              end
            end
          end
        else
          right_node = root.right = TreeNode.new(node_value)
          node_stack.push(right_node)
        end
      else
        current_node.right = TreeNode.new(node_value)
        node_stack.push(current_node)
        node_stack.push(current_node.right)
      end
    else
      # we are examining the current node somehow?
      p 'IN ELSE'
    end
  end

  root
end

p build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
p build_tree([-1], [-1])
