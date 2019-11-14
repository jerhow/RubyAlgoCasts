# // --- Directions
# // Given the root node of a tree, return
# // an array where each element is the width
# // of the tree at each level.
# // --- Example
# // Given:
# //     0
# //   / |  \
# // 1   2   3
# // |       |
# // 4       5
# // Answer: [1, 3, 2]

# Since we're evaluating tree width at each level, this problem is conducive
# to a solution using breadth-first traversal
def level_width(root)
  counters = [0] # Each element of 'counters' the number of nodes in each successive row
  queue = [root, '*'] # '*' is an arbitrary marker indicating the end of a row

  while queue.length > 1 # If there's only one element left, it's always '*'
    node = queue.shift
    if node == '*' # We've reached the end of a row:
      queue << '*' # ...so push a new marker onto the end of the queue
      counters << 0 # ...and push a new node counter onto 'counters' for the new row
    else
      counters[counters.length - 1] += 1 # Increment the current row's counter to reflect this node
      queue = queue + node.children # Push this node's children onto the end of the queue
    end
  end

  counters
end
