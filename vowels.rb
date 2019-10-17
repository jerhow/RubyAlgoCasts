# // --- Directions
# // Write a function that returns the number of vowels
# // used in a string.  Vowels are the characters 'a', 'e'
# // 'i', 'o', and 'u'.
# // --- Examples
# //   vowels('Hi There!') --> 3
# //   vowels('Why do you ask?') --> 4
# //   vowels('Why?') --> 0

# An iterative solution
# NOTE: include? also works on strings, but I think our intent is
# a bit more clear if we represent the vowels with an array.
#
def vowels(str)
  the_vowels = ['a', 'e', 'i', 'o', 'u']
  vowel_count = 0
  str.split('').each { |char|
    if the_vowels.include?(char.downcase)
      vowel_count += 1
    end
  }

  vowel_count
end

# A regex-based solution
def vowels2(str)
  str.scan(/[aeiou]/i).size
end

p vowels('Hi There!')
p vowels('Why do you ask?')
p vowels('Why?')
puts
p vowels2('Hi There!')
p vowels2('Why do you ask?')
p vowels2('Why?')
