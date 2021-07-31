require 'bigdecimal'

def coin_change(coins, amount)
  coin_cache = [BigDecimal::INFINITY] * (amount + 1)
  coin_cache[0] = 0

  coin_cache.each_with_index do |number_of_coins, sub_amount|
    coins.each do |coin|
      if coin <= sub_amount
        # p 'IN MAIN PART'
        remainder = sub_amount - coin

        number_of_coins_for_remainder = coin_cache[remainder]

        number_of_coins_for_sub_amount = number_of_coins_for_remainder + 1

        # p number_of_coins_for_sub_amount, coin_cache[sub_amount]
        coin_cache[sub_amount] = [coin_cache[sub_amount], number_of_coins_for_sub_amount].min
      end
    end
  end

  return -1 if coin_cache[amount] == BigDecimal::INFINITY

  coin_cache[amount]
end

p coin_change([1, 2, 5], 11) # 3
p coin_change([2], 3) # -1
p coin_change([2], 4) # 2
p coin_change([1,2147483647], 2) # 2
p coin_change([1, 3, 5], 7) # 3
p coin_change([1, 2, 5, 10], 18) # 4
p coin_change([2, 5, 10, 1], 27) # 4
p coin_change([186, 419, 83, 408], 6249) # 20
