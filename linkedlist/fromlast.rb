# // --- Directions
# // Given a linked list, return the element n spaces
# // from the last node in the list.  Do not call the 'size'
# // method of the linked list.  Assume that n will always
# // be less than the length of the list.
# // --- Examples
# //    const list = new List();
# //    list.insertLast('a');
# //    list.insertLast('b');
# //    list.insertLast('c');
# //    list.insertLast('d');
# //    fromLast(list, 2).data // 'b'

# require './node.rb'
# require './linkedlist.rb'

def from_last(list, n)
  ptr_a = list.get_first
  ptr_b = list.get_first

  # First, advance ptr_b by the value of n
  (1..n).each do
    ptr_b = ptr_b.next_node
  end

  # Then, walk both pointers forward by one, simultaneously,
  # until ptr_b reaches the end of the list (ptr_b remains 
  # n spaces ahead of ptr_a)
  while ptr_b.next_node
    ptr_a = ptr_a.next_node
    ptr_b = ptr_b.next_node
  end

  ptr_a # ptr_a will now point to the node n spaces from the end of the list
end

# ll = LinkedList.new
# ll.insert_last 'a'
# ll.insert_last 'b'
# ll.insert_last 'c'
# ll.insert_last 'd'
# ll.insert_last 'e'

# p from_last(ll, 3).data # should be 'b'
