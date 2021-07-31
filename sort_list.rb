require 'bigdecimal'

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

def sort_list(head)
  arr = []

  while head
    arr << head.val
    head = head.next
  end

  # arr = head
  sorted = merge_sort(arr)

  ListNode.from(sorted)
end

def merge_sort(arr)
  return arr if arr.size <= 1

  mid_point = arr.size / 2

  left = merge_sort(arr[0...mid_point])
  right = merge_sort(arr[mid_point..])

  merged = []
  left_index = 0
  right_index = 0

  loop do
    if left[left_index] && left[left_index] <= (right[right_index] || BigDecimal::INFINITY)
      merged << left[left_index]
      left_index += 1
    elsif right[right_index]
      merged << right[right_index]
      right_index += 1
    else
      break
    end
  end

  merged
end

p sort_list([4, 2, 1, 3]) # [1, 2, 3, 4]
# p sort_list(ListNode.from([4, 2, 1, 3])) # [1, 2, 3, 4]

p sort_list([-1, 5, 3, 4, 0]) # [-1, 0, 3, 4, 5]
# p sort_list(ListNode.from([-1, 5, 3, 4, 0])) # [-1, 0, 3, 4, 5]
# 
# p sort_list(ListNode.from([])) # []

input = [652,-760,-77,-365,717,640,887,-71,-766,-580,-862,-362,463,-187,-254,-706,561,-555,-932,-815,841,770,-360,-877,-539,29,-76,924,-346,-816,959,534,304,-328,833,-173,452,-534,669,-52,163,-681,-356,864,-320,457,662,122,-127,411,-261,-844,556,-119,-289,174,885,-278,507,-171,-43,791,371,86,-822,-764,-31,977,-648,527,-338,-405,-27,-842,-689,331,-535,-993,55,802,-562,-130,-176,626,810,370,999,216,875,459,-598,185,615,-728,-928,509,-37,-960,-577,25,434,531,438,757,-912,-564,233,510,902,872,760,951,-517,-235,-3,-996,554,-979,519,39,933,-487,24,-258,-617,472,256,-121,921,964,-492,-731,882,-992,384,-174,-288,-771,552,-707,-83,-856,-553,926,453,45,148,777,420,991,93,-650,-347,-70,435,634,379,116,-223,-799,-154,105,-701,-212,-415,389,-287,956,474,-733,-513,568,-342,722,360,-135,545,-667,326,584,-747,-927,347,-447,-916,271,-210,-133,-318,404,925,-753,-104,869,44,798,478,823,-931,149,918,599,-98,-949,68,-809,-607,182,-713,-465,-427,176,486,-44,-867,-868,278,909,-413,-584,208,-843,-8,-625,688,-749,296,-271,-291,157,11,-312,-317,-14,-182,827,946,328,-183,-898,659,399,383,-143,-818,-873,576,586,-185,422,-883,-419,-755,710,997,336,-866,-108,580,-167,-462,-283,-505,-169,-197,401,334,158,2,548,-947,-588,-550,915,-518,630,-178,-485,373,34,378,-67,-191,832,-854,143,583,-424,365,355,-724,-297,101,913,708,89,132,50,345,840,18,-476,359,910,-520,880,874,694,32,228,-685,151,506,436,15,28,-963,-498,-786,567,637,-687,-589,-13,-633,-899,-386,440,767,-361,-166,-950,628,-721,477,-348,-277,-738,-804,-872,-165,112,40,-972,171,-319,852,-90,-88,398,-164,-244,-441,115,-853,-542,-524,-575,-136,-116,-12,-819,431,713,686,-106,-309,81,560,344,-748,-684,352,-783,-522,-300,-831,931,114,52,-316,-909,-466,733,-353,333,860,1000,673,80,992,-376,-773,-219,-811,76,989,-30,912,-676,-981,-452,27,268,35,-451,-21,235,-294,-381,-418,-975,-545,141,-170]
p sort_list(input)
# p sort_list(ListNode.from(input))