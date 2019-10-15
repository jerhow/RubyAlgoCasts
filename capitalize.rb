# // --- Directions
# // Write a function that accepts a string.  The function should
# // capitalize the first letter of each word in the string then
# // return the capitalized string.
# // --- Examples
# //   capitalize('a short sentence') --> 'A Short Sentence'
# //   capitalize('a lazy fox') --> 'A Lazy Fox'
# //   capitalize('look, it is working!') --> 'Look, It Is Working!'

# VERSION 1:
def capitalize1(str)
  words = str.split(' ')
  words.each_with_index do |word, idx|
    words[idx] = word.capitalize
  end
  
  words.join(' ')
end

# VERSION 2:
# Like version 1, but implements the capitalization itself 
# instead of using String#capitalize
def capitalize2(str)
  words = str.split(' ')
  words.each_with_index do |word, idx|
    # ASCII letters are 32 spots from their other casing:
    # To capitalize, subtract. To lowercase, add.
    if word[0].ord >= 97 && word[0].ord <= 122
      words[idx] = (word[0].ord - 32).chr + word[1..-1] # slice the remainder of the word
    end
  end
  
  words.join(' ')
end

# Version 3: Walks the string back-looking for spaces and capitalizing accordingly.
# Always capitalizes first character, then skips index 0 for the loop so we don't 
# have to worry about trying to look past the lower bound of the string.
# Concatenates a new result string.
def capitalize3(str)
  result = str[0].capitalize
  (1..(str.length - 1)).each { |idx|
    if str[idx - 1] == " "
      result += str[idx].capitalize
    else
      result += str[idx]
    end
  }
  result
end

p capitalize1('a short sentence')
p capitalize1('a lazy fox')
p capitalize1('look, it is working!')
puts
p capitalize2('a short sentence')
p capitalize2('a lazy fox')
p capitalize2('look, it is working!')
puts
p capitalize3('a short sentence')
p capitalize3('a lazy fox')
p capitalize3('look, it is working!')
