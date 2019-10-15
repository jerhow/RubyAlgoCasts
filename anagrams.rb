# // --- Directions
# // Check to see if two provided strings are anagrams of each other.
# // One string is an anagram of another if it uses the same characters
# // in the same quantity. Only consider characters, not spaces
# // or punctuation.  Consider capital letters to be the same as lower case
# // --- Examples
# //   anagrams('rail safety', 'fairy tales') --> True
# //   anagrams('RAIL! SAFETY!', 'fairy tales') --> True
# //   anagrams('Hi there', 'Bye there') --> False

# LOGIC: 
# 1. Downcase the strings to eliminate uppercase letters
# 2. Use a regex to remove non-alphanumeric characters
# 3. split() into a char array
# 4. Ascending sort the char array
# 5. join() the array back into a string
#
# Do this for both strings, and return the result of comparing them.
#
def anagrams(stringA, stringB)
  compare_strA = stringA.downcase
                        .gsub(/[^\w]/, '')
                        .split('')
                        .sort { |a, b| a <=> b}
                        .join('')
  
  compare_strB = stringB.downcase
                        .gsub(/[^\w]/, '')
                        .split('')
                        .sort { |a, b| a <=> b}
                        .join('')
  
  compare_strA == compare_strB
end

# VERSION 2: A bit more involved, as it builds character frequency maps from the strings,
# and uses them to compare the contents of the strings.
# This also uses a helper method: build_char_map
#
# def anagrams(stringA, stringB)
#   char_mapA = build_char_map(
#     stringA.downcase.gsub(/[^\w]/, '')
#   )
  
#   char_mapB = build_char_map(
#     stringB.downcase.gsub(/[^\w]/, '')
#   )

#   if char_mapA.keys.length != char_mapB.keys.length
#     return false
#   end

#   char_mapA.each do |key, val|
#     if !char_mapB[key] || char_mapB[key] != char_mapA[key]
#       return false
#     end
#   end

#   true
# end

# def build_char_map(str)
#   char_map = {}
#   str.split('').each do |char|
#     char_map[char] ? char_map[char] += 1 : char_map[char] = 1
#   end
#   char_map
# end

p anagrams('rail safety', 'fairy tales')
p anagrams('RAIL! SAFETY!', 'fairy tales')
p anagrams('Hi there', 'Bye there')
