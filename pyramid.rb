# // --- Directions
# // Write a function that accepts a positive number N.
# // The function should console log a pyramid shape
# // with N levels using the # character.  Make sure the
# // pyramid has spaces on both the left *and* right hand sides
# // --- Examples
# //   pyramid(1)
# //       '#'
# //   pyramid(2)
# //       ' # '
# //       '###'
# //   pyramid(3)
# //       '  #  '
# //       ' ### '
# //       '#####'


#
# My thought process for solving this:
#
# First, it seemed intuitive to figure out the width of the widest level 
# of the pyramid (the bottom), since all level need to have this width.
#
# So, if we start with an index of 1 and write out a sample of indexes 
# and their respective level widths, they appear to take on a Fibonacci shape.
# That is, the current level width is always the sum of 
# the current index and the previous index:
#
# Index    Level Width   
#  1           1
#  2           3
#  3           5
#  4           7
#  5           9
#  6          11
#  7          13
# ...and so on.
#
# With this in mind, we know that if we take the number (n)
# that is passed in, we can say:
# level_width = n + (n - 1)
#
# From here, we iterate through all numbers from 1 to n,
# and on each pass we can calculate the number of hashes and blanks
# using only the current loop index and the width of the bottom level
# (which is the width that all levels need to have).
#
# Once we know the number of hashes and blanks, we can easily
# concatenate a string knowing that the blanks must be evenly
# distributes around the hashes.
#
def pyramid(n)
  level_width = n + (n - 1)

  (1..n).each { |idx|
    hashes = idx + (idx - 1)
    blanks = level_width - hashes
    p ' ' * (blanks / 2) + '#' * hashes + ' ' * (blanks / 2)
  }

  nil
end

# Recursive version of my previous iterative solution above.
# Basically just eliminates the loop. Tail-recursive.
def pyramid2(n, row = 1)
  
  # Base case
  return nil if (row - 1) == n
  # ^^ Note that we because we're starting our row index at 1 instead of 0, 
  # we have to base this calculation on row's value offset by -1.
  # Adjusting here means all our other logic works the same as the
  # iterative solution.

  level_width = n + (n - 1)
  hashes = row + (row - 1)
  blanks = level_width - hashes
  p ' ' * (blanks / 2) + '#' * hashes + ' ' * (blanks / 2)

  return pyramid2(n, row + 1)
end

# Another recursive solution, but a bit more convoluted
def pyramid3(n, row = 0, level = '')

  # Base case
  return nil if row == n

  # A level is complete
  if level.length == (2 * n) - 1
    p level
    return pyramid3(n, row + 1)
  end

  # Building up an individual stair
  midpoint = (((2 * n) - 1) / 2).floor
  add_to_level = ''
  if midpoint - row <= level.length && midpoint + row >= level.length
    add_to_level = '#'
  else
    add_to_level = ' '
  end

  pyramid3(n, row, level + add_to_level)
end

p pyramid(1)
puts
p pyramid(2)
puts
p pyramid(3)
puts
puts '--------------------------------------------'
puts
p pyramid2(1)
puts
p pyramid2(2)
puts
p pyramid2(3)
puts
puts '--------------------------------------------'
puts
p pyramid3(1)
puts
p pyramid3(2)
puts
p pyramid3(3)
