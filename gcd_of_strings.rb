# https://leetcode.com/problems/greatest-common-divisor-of-strings/

def gcd_of_strings(str1, str2)
  # ABABAB, ABAB
  #
  # 0. If the first letter of each string doesn't match return ''
  # 1. prefix_candidate: A -- invalid candidate for both 1 and 2
  # 2. prefix_candidate: AB -- valid candidate for both 1 and 2 (it repeats)
  # 3. prefix_candidate: ABA -- valid candidate for 1 but not 2

  return '' unless str1[0] == str2[0]

  str_index = 0
  min_length = [str1.length, str2.length].min
  prefix_candidate = ''
  last_valid_prefix_candidate = ''

  while str_index < min_length
    if str1[str_index] == str2[str_index]
      prefix_candidate << str1[str_index]
    end

    next_candidate_index = str_index + 1 + prefix_candidate.length - 1
    #puts "CURR #{str_index}, NEXT: #{next_candidate_index}"
    #if next_candidate_index <= min_length && str1[str_index + 1..next_candidate_index] == prefix_candidate
    if  (str1[str_index + 1..next_candidate_index] == prefix_candidate && str2[str_index + 1..next_candidate_index] == prefix_candidate) || (min_length - 1 == str_index && (str1[str_index + 1..next_candidate_index] == prefix_candidate || str2[str_index + 1..next_candidate_index] == prefix_candidate))
      #p 'HERE', prefix_candidate
      last_valid_prefix_candidate = prefix_candidate.dup
    end

    str_index += 1
  end

  last_valid_prefix_candidate
end

# str1 = 'ABCABC'
# str2 = 'ABC'
# p gcd_of_strings(str1, str2) # 'ABC'
# 
# str1 = 'ABABAB'
# str2 = 'ABAB'
# p gcd_of_strings(str1, str2) # 'AB'
# 
# str1 = 'LEET'
# str2 = 'CODE'
# p gcd_of_strings(str1, str2) # ''

# str1 = "ABABABAB"
# str2 = "ABAB"
# p gcd_of_strings(str1, str2) # 'ABAB'

str1 = "ABABABAB"
str2 = "ABAB"
p gcd_of_strings(str1, str2) # 'ABAB'

str1 = "TAUXXTAUXXTAUXXTAUXXTAUXX"
str2 = "TAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXXTAUXX"
p gcd_of_strings(str1, str2) # 'TAUXX'
