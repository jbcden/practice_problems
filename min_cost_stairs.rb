def min_cost_climbing_stairs(cost)
  cache = {}

  populate_cache(cost, 0, cache)

  # populate_cache(cost, 1, cache)

  [cache[cost.size - 1], cache[cost.size - 2]].compact.min
end

def populate_cache(cost, step, cache)
  running_total = cost[step]
  cache[step] = running_total

  loop do
    previous_step_value = if step - 1 < 0
                            0
                          else
                            cache[step - 1]
                          end

    prev_prev_step_value = if step - 2 < 0
                             0
                           else
                             cache[step - 2]
                           end

    next_step_candidate = [prev_prev_step_value, previous_step_value].min + cost[step]
    next_step_cached = cache[step]
    if next_step_cached
      cache[step] = [next_step_cached, next_step_candidate].min
    else
      cache[step] = next_step_candidate
    end

    step += 1
    break if step >= cost.size
  end
end

# p min_cost_climbing_stairs([10, 15, 20]) # 15

p min_cost_climbing_stairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) # 6

p min_cost_climbing_stairs([0, 1, 2, 2]) # 2
