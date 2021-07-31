def trailing_zeroes(n)
  return 0 if n.zero?

  count = 0

  while n > 0
    n /= 5
    count += n
  end

  count
end

# p trailing_zeroes(5)
# p trailing_zeroes(9052)
