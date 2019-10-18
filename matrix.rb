# // --- Directions
# // Write a function that accepts an integer N
# // and returns a NxN spiral matrix.
# // --- Examples
# //   matrix(2)
# //     [[1, 2],
# //     [4, 3]]
# //   matrix(3)
# //     [[1, 2, 3],
# //     [8, 9, 4],
# //     [7, 6, 5]]
# //  matrix(4)
# //     [[1,   2,  3, 4],
# //     [12, 13, 14, 5],
# //     [11, 16, 15, 6],
# //     [10,  9,  8, 7]]

def matrix(n)

  # Set up the results matrix
  results = []
  (0..n-1).each { |i|
    results.append([])
  }

  counter = 1
  start_col = 0
  end_col = n - 1
  start_row = 0
  end_row = n - 1

  while (start_col <= end_col) && (start_row <= end_row)
    # Top row
    (start_col..end_col).each { |i|
      results[start_row][i] = counter
      counter += 1
    }
    start_row += 1
    
    # Right column
    (start_row..end_row).each { |i|
      results[i][end_col] = counter
      counter += 1
    }
    end_col -= 1
    
    # Bottom row
    end_col.downto(start_col).each { |i|
      results[end_row][i] = counter
      counter += 1
    }
    end_row -= 1
    
    # Left column
    end_row.downto(start_row).each { |i|
      results[i][start_col] = counter
      counter += 1
    }
    start_col += 1
  end

  results
end

p matrix(4)

# =================================================================================
# NOTE: This is the exact same implementation, but with a ton of debugging output.
# It is helpful if you're trying to keep track of all the changing state
# as the script runs in the console. Or just trying to get your head around
# the logic at all. 
#
# When in doubt, always write out the resulting grid by hand ahead of time.
#
# Remember, these four inner loops constrain more and more as the process goes.
# On the final iteration of the outer loop you will not satisfy the conditions
# for every inner loop, when you're at the very innermost part of the spiral.
#
def matrix2(n)
  # Set up the results matrix
  results = []
  (0..n-1).each { |i|
    results.append([])
  }

  counter = 1
  start_col = 0
  end_col = n - 1
  start_row = 0
  end_row = n - 1

  while (start_col <= end_col) && (start_row <= end_row)

    puts
    puts "=============== TOP OF LOOP ======================================"
    puts
    p results
    puts
    puts "counter: #{counter}"
    puts "start_row: #{start_row}"
    puts "end_row: #{end_row}"
    puts "start_col: #{start_col}"
    puts "end_col: #{end_col}"
    puts

    puts "1: Top row happens:"
    
    # Top row
    (start_col..end_col).each { |i|
      puts "In the TOP ROW loop (forward | right) counter: #{counter}"
      results[start_row][i] = counter
      counter += 1
    }
    start_row += 1
    puts "start_row incremented"
    puts

    puts "DONE HAPPENING"
    puts

    puts
    p results
    puts
    puts "counter: #{counter}"
    puts "start_row: #{start_row}"
    puts "end_row: #{end_row}"
    puts "start_col: #{start_col}"
    puts "end_col: #{end_col}"
    puts

    puts
    puts "2: Right column happens:"
    
    # Right column
    (start_row..end_row).each { |i|
      puts "In the RIGHT COLUMN loop (forward | down) counter: #{counter}"
      results[i][end_col] = counter
      counter += 1
    }
    end_col -= 1
    puts "end_col decremented"
    puts

    puts "DONE HAPPENING"
    puts

    puts
    p results
    puts
    puts "counter: #{counter}"
    puts "start_row: #{start_row}"
    puts "end_row: #{end_row}"
    puts "start_col: #{start_col}"
    puts "end_col: #{end_col}"
    puts

    puts
    puts "3: Bottom row happens:"
    
    # Bottom row
    end_col.downto(start_col).each { |i|
      puts "In the BOTTOM ROW loop (backward | left) counter: #{counter}"
      results[end_row][i] = counter
      counter += 1
    }
    end_row -= 1
    puts "end_row decremented"
    puts

    puts "DONE HAPPENING"
    puts

    puts
    p results
    puts
    puts "counter: #{counter}"
    puts "start_row: #{start_row}"
    puts "end_row: #{end_row}"
    puts "start_col: #{start_col}"
    puts "end_col: #{end_col}"
    puts

    puts
    puts "4: Left column happens:"
    
    # Left column
    end_row.downto(start_row).each { |i|
      puts "In the LEFT COLUMN loop (backward | up) counter: #{counter}"
      results[i][start_col] = counter
      counter += 1
    }
    start_col += 1
    puts "start_col incremented"
    puts

    puts "DONE HAPPENING"
    puts

    puts
    p results
    puts
    puts "counter: #{counter}"
    puts "start_row: #{start_row}"
    puts "end_row: #{end_row}"
    puts "start_col: #{start_col}"
    puts "end_col: #{end_col}"
    puts

    puts
    puts "=============== BOTTOM OF LOOP ======================================"

  end

  puts "=============== PROGRAM FINISHED ======================================"
  results
end
