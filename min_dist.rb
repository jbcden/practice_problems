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
  @pre = nil
  @min = nil

  min_diff_in_bst_helper(root)

  @min
end

def min_diff_in_bst_helper(root, comp=nil, diff=nil)
  # p root&.val
  # p "#{root&.val}, #{comp&.val}"
  return unless root

  min_diff_in_bst_helper(root.left, root, diff)

  if @pre
    new_diff = (root.val - @pre.val).abs
    @min = new_diff if @min.nil?
    @min = new_diff if new_diff < @min
  end

  @pre = root
  min_diff_in_bst_helper(root.right, root, diff)
end

# root = TreeNode.from_list([4, 2, 6, 1, 3])
# p root
# p min_diff_in_bst(root) # 1

# root = TreeNode.from_list([1, 0, 48, nil, nil, 12, 49])
# p root
# p min_diff_in_bst(root) # 1

# root = TreeNode.from_list([4,2,6,1,3])
# p root
# p min_diff_in_bst(root) # 1

# root = TreeNode.from_list([27,nil,34,nil,58,50,nil,44])
# p min_diff_in_bst(root) # 6

# root = TreeNode.from_list([96,12,nil,nil,13,nil,52,29])
# p min_diff_in_bst(root) # 1

# root = TreeNode.from_list([90,69,nil,49,89,nil,52])
# p min_diff_in_bst(root) # 1

# root = TreeNode.from_list([98568,97374,nil,96613,nil,95959,nil,95228,nil,95159,nil,94023,nil,93929,nil,92673,nil,92530,nil,92008,nil,90321,nil,89989,nil,87136,nil,86048,nil,84477,nil,84007,nil,80640,nil,80464,nil,80105,nil,77816,nil,76857,nil,74881,nil,74046,nil,72848,nil,72488,nil,71658,nil,70244,nil,69015,nil,68869,nil,68776,nil,67639,nil,67345,nil,66828,nil,66231,nil,65855,nil,65546,nil,63729,nil,62272,nil,61003,nil,60498,nil,60299,nil,59396,nil,58820,nil,58048,nil,55222,nil,55127,nil,54411,nil,54265,nil,52825,nil,52258,nil,49666,nil,49483,nil,48706,nil,48043,nil,44683,nil,44676,nil,42687,nil,42233,nil,41966,nil,41686,nil,40847,nil,37002,nil,35884,nil,35536,nil,34548,nil,34473,nil,32473,nil,31192,nil,30960,nil,30295,nil,28294,nil,27798,nil,27311,nil,27095,nil,25434,nil,24804,nil,24661,nil,24579,nil,23798,nil,22737,nil,21136,nil,19504,nil,17291,nil,15411,nil,15208,nil,14902,nil,14186,nil,13341,nil,11562,nil,11133,nil,11069,nil,8904,nil,8677,nil,8037,nil,7789,nil,7380,nil,5816,nil,5580,nil,4059])
# p min_diff_in_bst(root) # 7?

# root = TreeNode.from_list([56,42,77,23,51,75,90,nil,nil,nil,nil,67,nil,78,99])
# p root
# p min_diff_in_bst(root) # 1
