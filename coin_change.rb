# def coin_change(coins, amount)
#   return 0 if amount.zero?
# 
#   coin_map = {}
#   coins.each { |coin| coin_map[coin] = true }
# 
#   return 1 if coin_map[amount]
# 
#   number_of_coins = 0
# 
#   coins.each do |coin|
#     next if coin > amount
# 
#     num_of_coins = amount / coin
# 
#     if amount % coin == 0
#       number_of_coins = num_of_coins
#     end
#     # puts '*' * 90
#     # p num_of_coins, number_of_coins
#     # puts '*' * 90
# 
#     current_total = num_of_coins * coin
#     next if current_total == amount
# 
#     if current_total > amount
#       next
#     else
#       # puts '*' * 90
#       # p 'ELSE', amount, current_total, number_of_coins
#       # puts '*' * 90
#       remaining_sum_present = coin_map[amount - current_total]
# 
#       if remaining_sum_present
#         num_of_coins += 1
# 
#         number_of_coins = num_of_coins if num_of_coins < number_of_coins
#       else
#         divisible_coins = coins.select { |coin| (amount - current_total) % coin == 0 }
# 
#         other_coin = divisible_coins.max
# 
#       puts '*' * 90
#         p number_of_coins, num_of_coins
#       puts '*' * 90
#         num_of_coins += (amount - current_total) / other_coin
# 
#         number_of_coins = num_of_coins if num_of_coins < number_of_coins
#       end
#     end
#   end
# 
#   return -1 if number_of_coins.zero?
# 
#   number_of_coins
# end

def coin_change(coins, amount)
  sum = _coin_change(coins, amount)

  return -1 if sum < 0

  sum
end

def _coin_change(coins, amount)
  return 0 if coins.empty? && amount == 0
  return -1000 if coins.empty? && amount > 0

  coins.sort!
  coin = coins.pop
  if coin <= amount
    number_of_coins = amount / coin
    remainder = amount - (coin * number_of_coins)

    puts '*' * 90
    p number_of_coins, coins, remainder
    puts '*' * 90
    number_of_coins + _coin_change(coins, remainder)
  else
    puts '*' * 90
    p number_of_coins, coins, amount
    puts '*' * 90
    0 + _coin_change(coins, amount)
  end
end

# p coin_change([1, 2, 5], 11) # 3
# p coin_change([2], 3) # -1
# p coin_change([2], 4) # 2
# p coin_change([1,2147483647], 2) # 2
# p coin_change([1, 3, 5], 7) # 3
# p coin_change([1, 2, 5, 10], 18) # 4
# p coin_change([2, 5, 10, 1], 27) # 4
p coin_change([186, 419, 83, 408], 6249) # 20

