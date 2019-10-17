# // --- Directions
# // Write a function that accepts a positive number N.
# // The function should console log a step shape
# // with N levels using the # character.  Make sure the
# // step has spaces on the right hand side!
# // --- Examples
# //   steps(2)
# //       '# '
# //       '##'
# //   steps(3)
# //       '#  '
# //       '## '
# //       '###'
# //   steps(4)
# //       '#   '
# //       '##  '
# //       '### '
# //       '####'

# There are a bunch of ways you can approach this iteratively. 
# Here's one:
def steps1(n)
  (1..n).each { |step_length|
    puts ('#' * step_length) + (' ' * (n - step_length))
  }
  nil
end

# A recursive version:
def steps2(n, row = 0, stair = '')

  # Base case:
  return nil if row == n

  # A stair is complete:
  if stair.length == n
    puts stair
    return steps2(n, row + 1)
  end

  # Building up an individual stair:
  if stair.length <= row
    stair += '#'
  else
    stair += ' '
  end

  # If we get here, we're still building one of our stairs;
  # so call the function again, with only the value of 'stair' having changed.
  steps2(n, row, stair)
end

# NOTE: If you want to see the string values wrapped in quotes,
# to prove that the space-padding is working correctly,
# print the output with p() instead of puts().
#
# For example, in steps1:
# p ('#' * step_length) + (' ' * (n - step_length))
#
# ...or in steps2:
# p stair

p steps1(2)
p steps1(3)
p steps1(4)
puts
p steps2(2)
p steps2(3)
p steps2(4)
