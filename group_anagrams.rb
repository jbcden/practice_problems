def group_anagrams(strs)
  res = []
  cache = {}

  strs.each do |str|
    cache_key = str.bytes.sort
    if cache[cache_key]
      cache[cache_key] << str
    else
      tmp = [str]
      res << tmp
      cache[cache_key] = tmp
    end
  end

  res
end

p group_anagrams(["eat","tea","tan","ate","nat","bat"])
p group_anagrams([""])

  # strs.each do |str|
  #   cache_key = str.each_byte.reduce(:+)
  #   if cache[cache_key]
  #     cache[cache_key] << str
  #   else
  #     tmp = [str]
  #     res << tmp
  #     cache[cache_key] = tmp
  #   end
  # end
