def reverse(string)
  return '' if string.empty?

  reverse(string[1..]) << string[0]
end

p reverse('abcdefghijklmnop')
