# // --- Directions
# // 1) Implement the Node class to create
# // a binary search tree.  The constructor
# // should initialize values 'key', 'left',
# // and 'right'.
# // 2) Implement the 'insert' method for the
# // Node class.  Insert should accept an argument
# // 'key', then create an insert a new node
# // at the appropriate location in the tree.
# // 3) Implement the 'contains' method for the Node
# // class.  Contains should accept a 'key' argument
# // and return the Node in the tree with the same value.

class Node
  attr_accessor :key, :left, :right

  def initialize(key)
    @key = key
    @left = nil
    @right = nil
  end

  # With BSTs, I believe this is more commonly called 'search'.
  #
  # Anyway, searching is one of the great things about BSTs.
  # Each time you recurse to traverse the tree, you discard
  # half of the nodes in the tree. BST search runs in O(log n) / logarithmic time.
  def contains(key)
    return self if key == @key # Match - return the node

    if key < @key && @left
      @left.contains(key)
    elsif key > @key && @right
      @right.contains(key)
    else
      nil # We have not found a value and we have no more nodes to descend to, so return nil
    end
  end

  # Recursive:
  def insert(new_key)
    if new_key < @key && @left
      @left.insert(new_key)
    elsif new_key < @key
      @left = Node.new(new_key)
    elsif new_key > @key && @right
      @right.insert(new_key)
    elsif new_key > @key
      @right = Node.new(new_key)
    end
  end

  # Iterative:
  # def insert(key)
  #   previous = nil
  #   current = self

  #   while current
  #     previous = current

  #     if key < current.key
  #       current = current.left
  #     elsif key > current.key
  #       current = current.right
  #     end
  #   end

  #   if !previous
  #     self.key = key
  #   elsif key < previous.key
  #     previous.left = Node.new(key)
  #   elsif key > previous.key
  #     previous.right = Node.new(key)
  #   end
  # end
end

def is_valid?(node, min = nil, max = nil)
  # Walk through this solution with a diagram to avoid brain explosion

  # Left side value check
  return false if max && node.key > max
  
  # Right side value check
  return false if min && node.key < min
  
  # Left side traversal
  return false if node.left && !is_valid?(node.left, min, node.key)
  
  # Right side traversal
  return false if node.right && !is_valid?(node.right, node.key, max)

  true
end
