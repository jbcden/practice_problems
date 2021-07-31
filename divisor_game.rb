# choose x such that: 0 < x < n && n % x == 0
# replace n with n - x
def divisor_game(n)
  turn = 0

  loop do
    (n-1).downto(1).each do |x|
      # SOMETHING if n % x == 0
    end
  end

  turn.odd?
end

p divisor_game(2) # true
p divisor_game(3) # false
