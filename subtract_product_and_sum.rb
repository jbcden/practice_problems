# https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/

def subtract_product_and_sum(n)
  digits = n.digits

  product = digits.reduce(&:*)
  sum = digits.sum

  product - sum
end

p subtract_product_and_sum(234)
