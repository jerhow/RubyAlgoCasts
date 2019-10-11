def reverse1(str)
  str.reverse
end

def reverse2(str)
  str.split('').reverse.join('')
end

def reverse3(str)
  reversed = ''
  str.split('').each { |char|
    reversed = char + reversed
  }
  reversed
end

def reverse4(str)
  str.split('').reduce('') { |reversed, char| char + reversed }
end

puts reverse1 'Greetings!'
puts reverse2 'Greetings!'
puts reverse3 'Greetings!'
puts reverse4 'Greetings!'
