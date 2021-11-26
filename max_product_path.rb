# https://leetcode.com/problems/maximum-non-negative-product-in-a-matrix/

MODULO_CONSTANT = 10**9 + 7

def max_product_path(grid)
  number_of_rows = grid.size
  number_of_columns = grid[0].size

  cache = Array.new(number_of_rows) { Array.new(number_of_columns) }

  grid.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      current_cell_value = grid[row_index][column_index]

      cache[row_index][column_index] = if row_index == 0 && column_index == 0
                                         [current_cell_value]
                                       elsif row_index == 0
                                         candidates = cache[row_index][column_index - 1]

                                         new_candidate_set = candidates.map do |candidate|
                                           candidate * current_cell_value
                                         end

                                         new_candidate_set.minmax
                                       elsif column_index == 0
                                         candidates = cache[row_index - 1][column_index]

                                         new_candidate_set = candidates.map do |candidate|
                                           candidate * current_cell_value
                                         end

                                         new_candidate_set.minmax
                                       else
                                         horizontal_candidates = cache[row_index][column_index - 1]
                                         vertical_candidates = cache[row_index - 1][column_index]

                                         horizontals = horizontal_candidates.map do |candidate|
                                           candidate * current_cell_value
                                         end

                                         verticals = vertical_candidates.map do |candidate|
                                           candidate * current_cell_value
                                         end

                                         all = verticals + horizontals

                                         all.minmax
                                       end
    end
  end

  pp cache
  if (max = cache[-1][-1]).all?(&:negative?)
    -1
  else
    max.max % MODULO_CONSTANT
  end
end

# grid = [[-1,-2,-3],
#         [-2,-3,-3],
#         [-3,-3,-2]]
# p max_product_path(grid) # -1
# 
# grid = [[1,-2,1],[1,-2,1],[3,-4,1]]
# p max_product_path(grid) # 8

grid = [[2,1,3,0,-3,3,-4,4,0,-4],[-4,-3,2,2,3,-3,1,-1,1,-2],[-2,0,-4,2,4,-3,-4,-1,3,4],[-1,0,1,0,-3,3,-2,-3,1,0],[0,-1,-2,0,-3,-4,0,3,-2,-2],[-4,-2,0,-1,0,-3,0,4,0,-3],[-3,-4,2,1,0,-4,2,-4,-1,-3],[3,-2,0,-4,1,0,1,-3,-1,-1],[3,-4,0,2,0,-2,2,-4,-2,4],[0,4,0,-3,-4,3,3,-1,-2,-2]]
p max_product_path(grid) # 19215865

