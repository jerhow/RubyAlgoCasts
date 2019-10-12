# // --- Directions
# // Given a string, return the character that is most
# // commonly used in the string.
# // --- Examples
# // maxChar("abcccccccd") === "c"
# // maxChar("apple 1231111") === "1"

# SOLUTION 1
# Reverse-sorts the results hash to find the most frequent character from its keys
def max_char1(str)
  results = {}
  
  str.split('').each do |char|
    results[char] ? results[char] += 1 : results[char] = 1
  end
  
  results.sort_by { |k, v| v }.reverse.to_h.keys.first
end

# SOLUTION 2
# Iterates over the results hash to find the most frequent character
def max_char2(str)
  results = {}
  max_char = ''
  max_count = 0
  
  str.split('').each do |char|
    results[char] ? results[char] += 1 : results[char] = 1
  end
  
  results.each do |key, val|
    if results[key] > max_count
      max_char = key
      max_count = results[key]
    end
  end

  max_char
end


puts max_char1("abcccccccd")
puts max_char1("apple 1231111")
puts
puts max_char2("abcccccccd")
puts max_char2("apple 1231111")
