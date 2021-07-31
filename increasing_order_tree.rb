class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def self.from_list(arr)
    if !arr.length || arr[0].nil?
      return nil
    end

    res = TreeNode.new(arr[0]);
    nodes = arr[1..];
    children = [res];

    while children.length > 0
      current = children.shift()

      if !current || current.val.nil?
        next
      end

      if nodes.length
        val = nodes.shift()
        if val
          current.left = TreeNode.new(val)
          children.push(current.left)
        end
      end

      if nodes.length
        val = nodes.shift()
        if val
          current.right = TreeNode.new(val)
          children.push(current.right)
        end
      end
    end

    return res
  end
end

def increasing_bst(root)
  @root = nil
  @current_root = nil

  helper(root)

  @root
end

def helper(root)
  return unless root

  helper(root.left)

  if @current_root
    node = TreeNode.new(root.val)
    @current_root.right = node
    @current_root = node
  else
    @root = TreeNode.new(root.val)
    @current_root = @root
  end

  helper(root.right)
end

root = TreeNode.from_list([5,3,6,2,4,nil,8,1,nil,nil,nil,7,9])
# p root
p increasing_bst(root)
