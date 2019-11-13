# // --- Directions
# // Given a linked list, return true if the list
# // is circular, false if it is not.
# // --- Examples
# //   const l = new List();
# //   const a = new Node('a');
# //   const b = new Node('b');
# //   const c = new Node('c');
# //   l.head = a;
# //   a.next = b;
# //   b.next = c;
# //   c.next = b;
# //   circular(l) // true

# require './node.rb'
# require './linkedlist.rb'

def circular(list)
  fwd_by_one = list.get_first
  fwd_by_two = list.get_first

  while fwd_by_two.next_node && fwd_by_two.next_node.next_node
    fwd_by_one = fwd_by_one.next_node
    fwd_by_two = fwd_by_two.next_node.next_node

    if fwd_by_one.next_node == fwd_by_two.next_node
      return true
    end
  end

  false
end

# l = LinkedList.new
# a = Node.new('a')
# b = Node.new('b')
# c = Node.new('c')
# d = Node.new('d')
# e = Node.new('e')

# l.head = a
# a.next_node = b
# b.next_node = c
# c.next_node = d
# d.next_node = c
# e.next_node = d

# p circular(l) # should be true
