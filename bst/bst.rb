# // --- Directions
# // 1) Implement the Node class to create
# // a binary search tree.  The constructor
# // should initialize values 'data', 'left',
# // and 'right'.
# // 2) Implement the 'insert' method for the
# // Node class.  Insert should accept an argument
# // 'data', then create an insert a new node
# // at the appropriate location in the tree.
# // 3) Implement the 'contains' method for the Node
# // class.  Contains should accept a 'data' argument
# // and return the Node in the tree with the same value.

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  # With BSTs, I believe this is more commonly called 'search'.
  #
  # Anyway, searching is one of the great things about BSTs.
  # Each time you recurse to traverse the tree, you discard
  # half of the nodes in the tree. BST search runs in O(log n) / logarithmic time.
  def contains(data)
    return self if data == @data # Match - return the node

    if data < @data && @left
      @left.contains(data)
    elsif data > @data && @right
      @right.contains(data)
    else
      nil # We have not found a value and we have no more nodes to descend to, so return nil
    end
  end

  # Recursive:
  def insert(new_data)
    if new_data < @data && @left
      @left.insert(new_data)
    elsif new_data < @data
      @left = Node.new(new_data)
    elsif new_data > @data && @right
      @right.insert(new_data)
    elsif new_data > @data
      @right = Node.new(new_data)      
    end
  end

  # Iterative:
  # def insert(data)
  #   previous = nil
  #   current = self

  #   while current
  #     previous = current

  #     if data < current.data
  #       current = current.left
  #     elsif data > current.data
  #       current = current.right
  #     end  
  #   end

  #   if !previous
  #     self.data = data
  #   elsif data < previous.data
  #     previous.left = Node.new(data)
  #   elsif data > previous.data
  #     previous.right = Node.new(data)      
  #   end
  # end
end

# node = Node.new(10)
# node.insert 5
# node.insert 15
# node.insert 20
# node.insert 0
# node.insert -5
# node.insert 3

# three = node.left.left.right
# # puts
# # p node
# puts
# p three
# puts
# p node.contains(3)
# puts
