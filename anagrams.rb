def anagrams(str)
  return [] if str.nil?
  return [str] if str.length == 1

  res = []

  char = str[-1]

  combos = anagrams(str[0..-2])

  combos.each do |anagram|
    (0..anagram.size).each do |n|
      res << anagram.dup.insert(n, char)
    end
  end

  res
end

p anagrams('a')
p anagrams('ab')
p anagrams('abc')
p anagrams('abcd')
