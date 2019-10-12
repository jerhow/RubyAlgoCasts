# // --- Directions
# // Given an integer, return an integer that is the reverse
# // ordering of numbers.
# // --- Examples
# //   reverseInt(15) === 51
# //   reverseInt(981) === 189
# //   reverseInt(500) === 5
# //   reverseInt(-15) === -51
# //   reverseInt(-90) === -9

# Version 1 solves with a text/char approach, but it's kind of a hack.
# Although I do admire the pop -> unshift on the array.
def reverse_int1(n)
  reversed = n.to_s.split('').reverse
  if reversed.last == "-"
    reversed.unshift(reversed.pop)
  end
  reversed.join('').to_i
end

# Version 2 solves in a preferable way, I think.
def reverse_int2(n)
  reversed = n.to_s.split('').reverse.join('')
  
  # Ruby doesn't have an equivalent of JS's Math.sign(), so we do it here
  if n > 0
    sign = 1
  elsif n < 0
    sign = -1
  else
    sign = 0
  end

  # Multiply the reversed int by the sign of its original value
  # to make it correctly positive or negative
  reversed.to_i * sign
end

puts reverse_int1(15)
puts reverse_int1(981)
puts reverse_int1(500)
puts reverse_int1(-15)
puts reverse_int1(-90)
puts
puts reverse_int2(15)
puts reverse_int2(981)
puts reverse_int2(500)
puts reverse_int2(-15)
puts reverse_int2(-90)
