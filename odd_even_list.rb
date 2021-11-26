# https://leetcode.com/problems/odd-even-linked-list/

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

def odd_even_list(head)
  odd = true
  odds = []
  evens = []

  until head.nil?
    if odd
      odds << head
    else
      evens << head
    end

    head = head.next

    odd ^= true
  end

  head = odds.shift
  node = head
  odds.each do |odd_node|
    node.next = odd_node
    node = node.next
  end

  evens.each do |even_node|
    node.next = even_node
    node = node.next
  end

  if node
    node.next = nil
  end

  head
end

p odd_even_list(ListNode.from([1,2,3,4,5]))
