def max_profit(prices)
  current_choice = prices[0]
  profit_so_far = 0
  index = 0

  while index < prices.size
    if prices[index] < current_choice
      current_choice = prices[index]
    else
      if prices[index] > prices[index + 1].to_i
        profit_so_far += prices[index] - current_choice
        current_choice = prices[index + 1]
      end
    end

    index += 1
  end

  profit_so_far
end

p max_profit([7, 1, 5, 3, 6, 4]) # 7

p max_profit([7, 1, 3, 5, 6, 4]) # 5

p max_profit([1, 2, 3, 4, 5]) # 4

p max_profit([7, 6, 4, 3, 1]) # 0
