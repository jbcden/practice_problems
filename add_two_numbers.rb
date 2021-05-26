# frozen_string_literal: true

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end

  def self.from(array)
    result = ListNode.new(nil, nil)
    node = result
    array.each do |n|
      node = if node.val
               next_node = ListNode.new
               node.next = next_node
               next_node
             else
               node
             end

      node.val = n
    end

    result
  end
end

def add_two_numbers(l1, l2)
  remainder = 0
  result = ListNode.new
  node = result

  while l1 || l2 || remainder > 0
    sum = l1&.val.to_i + l2&.val.to_i + remainder

    remainder = 0

    remainder = 1 if sum > 9
    sum = sum % 10 if sum > 9


    node.next = ListNode.new(sum)
    node = node.next

    l1 = l1&.next
    l2 = l2&.next
  end

  result.next
end

l1= ListNode.from([9,9,9,9,9,9,9])
l2= ListNode.from([9,9,9,9])

# l1= ListNode.from([1,8])
# l2= ListNode.from([0])
p add_two_numbers(l1, l2)
