class Node
  attr_accessor :val, :next, :random
  def initialize(val = 0)
    @val = val
    @next = nil
    @random = nil
  end

  def self.build(arr)
    return nil if arr.size == 0

    root = Node.new(arr[0])
    current_node = root

    arr[1..].each do |elem|
      node = Node.new(elem)
      current_node.next = node
      current_node = node
    end

    root
  end
end

def copyRandomList(head) # this name is leetcode's fault
  return nil unless head
  # create 2 arrays:
  # 1. old nodes
  # 2. new nodes
  #
  # iterate through a second time, use array 1 to determine which node
  # the random node is and use second array to retrieve the new one and assign
  new_root = Node.new(head.val)
  old_list = [head]
  new_list = [new_root]

  current_old_head = head.next
  current_new_head = new_root

  while !current_old_head.nil?
    old_list << current_old_head

    new_node = Node.new(current_old_head.val)
    current_new_head.next = new_node
    new_list << new_node

    current_new_head = new_node
    current_old_head = current_old_head.next
  end

  current_new_head = new_root

  current_index = 0
  while !current_new_head.nil?
    original_node = old_list[current_index]
    random_node_index = old_list.index(original_node.random)
    if random_node_index.nil?
      current_new_head.random = nil
    else
      new_random_node = new_list[random_node_index]
      current_new_head.random = new_random_node
    end

    current_new_head = current_new_head.next
    current_index += 1
  end

  new_root
end

p copyRandomList(Node.build([[7, nil], [13, 0], [11, 4], [10, 2],[1,0]]))
