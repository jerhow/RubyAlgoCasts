# // --- Directions
# // Return the 'middle' node of a linked list.
# // If the list has an even number of elements, return
# // the node at the end of the first half of the list.
# // *Do not* use a counter variable, *do not* retrieve
# // the size of the list, and only iterate
# // through the list one time.
# // --- Example
# //   const l = new LinkedList();
# //   l.insertLast('a')
# //   l.insertLast('b')
# //   l.insertLast('c')
# //   midpoint(l); // returns { data: 'b' }

# require './node.rb'
# require './linkedlist.rb'

def midpoint(list)
  return nil if list.head.nil?

  fwd_by_one = list.get_first # head
  fwd_by_two = list.get_first # head

  while fwd_by_two.next_node && fwd_by_two.next_node.next_node
    fwd_by_one = fwd_by_one.next_node
    fwd_by_two = fwd_by_two.next_node.next_node
  end

  fwd_by_one # the midpoint
end

# ll_empty = LinkedList.new
# p midpoint(ll_empty) # should be nil

# ll_one = LinkedList.new
# ll_one.insert_last 'a'
# p midpoint(ll_one).data # should be 'a'

# ll_odd = LinkedList.new
# ll_odd.insert_last 'a'
# ll_odd.insert_last 'b'
# ll_odd.insert_last 'c'
# ll_odd.insert_last 'd'
# ll_odd.insert_last 'e'
# p midpoint(ll_odd).data # should be 'c'

# ll_even = LinkedList.new
# ll_even.insert_last 'a'
# ll_even.insert_last 'b'
# ll_even.insert_last 'c'
# ll_even.insert_last 'd'
# p midpoint(ll_even).data # should be 'b'
