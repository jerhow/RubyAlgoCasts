def palindrome1(str)
  str == str.reverse
end

def palindrome2(str)
  offset = str.length - 1

  str.split('').each do |c|
    if c != str[offset]
      return false
    end
    offset = offset - 1
  end

  return true
end

def palindrome3(str)
  str.split('').each_with_index do |c, idx|
    if c != str[(str.length - idx) - 1]
      return false
    end
  end

  return true
end

puts palindrome1 'racecar'
puts palindrome1 'apple'
puts
puts palindrome2 'racecar'
puts palindrome2 'apple'
puts
puts palindrome3 'racecar'
puts palindrome3 'apple'
