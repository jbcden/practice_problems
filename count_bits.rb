def count_bits(n)
  res = [0]

  (1..n).each do |i|
    bits = if i.odd?
             res[i - 1] + 1
           else
             res[i / 2]
           end
    res << bits
  end

  res
end

p count_bits(2) # [0, 1, 1]
p count_bits(5) # [0, 1, 1, 2, 1, 2]
p count_bits(0) # [0]
