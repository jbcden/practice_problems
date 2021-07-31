def max_profit(prices)
  current_choice = prices[0]
  max_so_far = nil
  index = 1

  while index < prices.size do
    if prices[index] < current_choice
      current_choice = prices[index]
    else
      max_so_far = [max_so_far, prices[index] - current_choice].compact.max
    end

    index += 1
  end

  return 0 if max_so_far.nil? || max_so_far <= 0

  max_so_far
end

p max_profit([7, 1, 5, 3, 6, 4]) # 5
p max_profit([7, 6, 4, 3, 1]) # 0
