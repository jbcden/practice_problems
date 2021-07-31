def longest_palindrome(s, cache={})
  return s if s.length == 1
  cache = {}

  (0..s.length - 1).each do |start|
    (1..s.length - 1).each do |end_index|
      if s[start] == s[end_index]
        if end_index - start == 1 || cache[[start, end]]

      end
    end
  end
end

def is_palindrome?(s, characters, cache)
  return true if cache[s]

  start = 0
  end_index = s.size - 1

  loop do
    if s[start] == s[end_index]
      break if start == end_index || start > end_index
      start += 1
      end_index -= 1
    else
      return false
    end
  end

  cache[s] = true

  characters.each do |char|
    cache[char + s + char] = true
  end

  true
end

# p longest_palindrome('babad') # 'bab'
# p longest_palindrome('cbbd') # 'bb'
# p longest_palindrome('a') # 'a'
# p longest_palindrome('ac') # 'a'
# p longest_palindrome("abbcccbbbcaaccbababcbcabca")
p longest_palindrome("rgczcpratwyqxaszbuwwcadruayhasynuxnakpmsyhxzlnxmdtsqqlmwnbxvmgvllafrpmlfuqpbhjddmhmbcgmlyeypkfpreddyencsdmgxysctpubvgeedhurvizgqxclhpfrvxggrowaynrtuwvvvwnqlowdihtrdzjffrgoeqivnprdnpvfjuhycpfydjcpfcnkpyujljiesmuxhtizzvwhvpqylvcirwqsmpptyhcqybstsfgjadicwzycswwmpluvzqdvnhkcofptqrzgjqtbvbdxylrylinspncrkxclykccbwridpqckstxdjawvziucrswpsfmisqiozworibeycuarcidbljslwbalcemgymnsxfziattdylrulwrybzztoxhevsdnvvljfzzrgcmagshucoalfiuapgzpqgjjgqsmcvtdsvehewrvtkeqwgmatqdpwlayjcxcavjmgpdyklrjcqvxjqbjucfubgmgpkfdxznkhcejscymuildfnuxwmuklntnyycdcscioimenaeohgpbcpogyifcsatfxeslstkjclauqmywacizyapxlgtcchlxkvygzeucwalhvhbwkvbceqajstxzzppcxoanhyfkgwaelsfdeeviqogjpresnoacegfeejyychabkhszcokdxpaqrprwfdahjqkfptwpeykgumyemgkccynxuvbdpjlrbgqtcqulxodurugofuwzudnhgxdrbbxtrvdnlodyhsifvyspejenpdckevzqrexplpcqtwtxlimfrsjumiygqeemhihcxyngsemcolrnlyhqlbqbcestadoxtrdvcgucntjnfavylip")
