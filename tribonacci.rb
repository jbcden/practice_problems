def tribonacci(n)
  cache ||= {
    0 => 0,
    1 => 1,
    2 => 1
  }

  _tribonacci(n, cache)
end

def _tribonacci(n, cache)
  return cache[n] if cache && cache[n]

  cache[n] = _tribonacci(n - 3, cache) + _tribonacci(n - 2, cache) + _tribonacci(n - 1, cache)

  cache[n]
end

p tribonacci(4) # 4
p tribonacci(25) # 1389537
