class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.build(arr)
    return nil if arr.size == 0

    root = ListNode.new(arr[0])
    current_node = root

    arr[1..].each do |elem|
      node = ListNode.new(elem)
      current_node.next = node
      current_node = node
    end

    root
  end
end

def merge_two_lists(l1, l2)
  root = ListNode.new

  _merge_two_lists(l1, l2, root)

  root.next
end

def _merge_two_lists(l1, l2, res)
  if l1.nil? && l2.nil?
    return res
  elsif l1.nil?
    res.next = l2
    return
  elsif l2.nil?
    res.next = l1
    return
  end

  if l1.val <= l2.val
    new_node = ListNode.new(l1.val)
    res.next = new_node
    res = new_node
    _merge_two_lists(l1.next, l2, res)
  elsif l2.val <= l1.val
    new_node = ListNode.new(l2.val)
    res.next = new_node
    res = new_node
    _merge_two_lists(l1, l2.next, res)
  end
end

# l1 = ListNode.build([1, 2, 4])
# l2 = ListNode.build([1, 3, 4])
# 
# p merge_two_lists(l1, l2)

l1 = ListNode.build([])
l2 = ListNode.build([])
p merge_two_lists(l1, l2)
