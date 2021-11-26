# https://leetcode.com/problems/clone-graph/

# class GraphNode
#   attr_accessor :val, :neighbors
#   def initialize(val = 0, neighbors = nil)
#     @val = val
#     neighbors = [] if neighbors.nil?
#     @neighbors = neighbors
#   end
# 
#   def self.from_adjacency_list(list)
#     head = nil
#     list.each_with_index(1) do |neighbors, index|
#       Node.new(index, neighbors)
#     end
#   end
# end

def cloneGraph(node)
  return nil unless node

  # 1. Create a HashSet of new nodes
  # 2. Iterate through HashSet and set neighbors
  new_node_cache = {}
  old_node_cache = {}

  create_new_nodes(node, new_node_cache, old_node_cache)

  old_node_cache.values.each do |old_node|
    new_node = new_node_cache[old_node.val]

    old_node.neighbors.each do |neighbor|
      new_neighbor = new_node_cache[neighbor.val]
      new_node.neighbors << new_neighbor
    end
  end

  new_node_cache[1]
end

def create_new_nodes(old_node, new_node_cache, old_node_cache)
  return if new_node_cache[old_node.val]

  new_node = Node.new(old_node.val)
  new_node_cache[old_node.val] = new_node
  old_node_cache[old_node.val] = old_node

  old_node.neighbors.each do |neighbor|
    create_new_nodes(neighbor, new_node_cache, old_node_cache)
  end
end
