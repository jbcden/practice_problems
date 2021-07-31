# possibly correct but very slow
#  def climb_stairs(n)
#   return 0 if n < 0
#   return 1 if n.zero?
#   return 2 if n == 2
#
#   climb_stairs(n - 2) + climb_stairs(n - 1)
# end

def climb_stairs(n)
  cache = {
    0 => 0,
    1 => 1,
    2 => 2
  }

  step = 3

  loop do
    if cache[step - 2] && cache[step - 1]
      cache[step] = cache[step - 2] + cache[step - 1]
    end

    break if step >= (n - 1)
    step += 1
  end

  if n <= 2
    cache[n]
  else
    cache[n - 2] + cache[n - 1]
  end
end

p climb_stairs(2) # 2
p climb_stairs(3) # 3
p climb_stairs(35) # 
