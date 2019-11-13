# // --- Directions
# // 1) Create a node class.  The constructor
# // should accept an argument that gets assigned
# // to the data property and initialize an
# // empty array for storing children. The node
# // class should have methods 'add' and 'remove'.
# // 2) Create a tree class. The tree constructor
# // should initialize a 'root' property to null.
# // 3) Implement 'traverseBF' and 'traverseDF'
# // on the tree class.  Each method should accept a
# // function that gets called with each element in the tree

require "awesome_print"

class Node
  attr_accessor :data, :children

  def initialize(data)
    @data = data
    @children = []
  end

  def add(data)
    @children << Node.new(data)
  end

  def remove(val)
    # No need to iterate here because Ruby:
    #
    @children.delete_if { |c| c.data == val } # Modify @children in-place
    # @children = @children.reject { |c| c.data == val } # Return a new array
    # @children = @children.select { |c| c.data != val } # Return a new array
    #
    # ^^ Same result for these three techniques
  end
end

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def traverse_bf(&block)
    arr = [@root]

    while arr.length > 0
      node = arr.shift
      arr = arr + node.children # BF adds the node's children to the END of the array
      yield(node)
    end
  end

  def traverse_df(&block)
    arr = [@root]

    while arr.length > 0
      node = arr.shift
      arr = node.children + arr # DF adds the node's children to the FRONT of the array
      yield(node)
    end
  end
end
