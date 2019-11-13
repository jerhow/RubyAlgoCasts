# ruby -I lib:test test_linkedlist.rb -v

require 'minitest/autorun'
require './node.rb'
require './linkedlist.rb'
require './midpoint.rb'

class TestLinkedList < MiniTest::Unit::TestCase
  def setup
    @node = Node.new("Hi")
    @linked_list = LinkedList.new
  end

  def test_node_is_a_node
    assert_equal Node, @node.class
  end

  def test_linkedlist_is_a_linkedlist
    assert_equal LinkedList, @linked_list.class
  end

  def test_node_has_data_property
    node = Node.new('a')
    assert_equal 'a', node.data
  end

  def test_node_has_next_node_property
    node = Node.new('a', 'b')
    assert_equal 'b', node.next_node
  end

  # LinkedList#insert_first
  def test_appends_a_node_to_the_start_of_the_list
    ll = LinkedList.new
    ll.insert_first 1
    assert_equal 1, ll.head.data
    ll.insert_first 2
    assert_equal 2, ll.head.data
  end

  # LinkedList#size
  def test_returns_the_number_of_items_in_the_linked_list
    ll = LinkedList.new
    assert_equal 0, ll.size
    ll.insert_first 1
    ll.insert_first 1
    ll.insert_first 1
    ll.insert_first 1
    assert_equal 4, ll.size
  end

  # LinkedList#get_first
  def test_returns_the_first_node
    ll = LinkedList.new
    ll.insert_first 1
    assert_equal 1, ll.get_first.data
    ll.insert_first 2
    assert_equal 2, ll.get_first.data
  end

  # LinkedList#get_last
  def test_returns_the_last_node
    ll = LinkedList.new
    expected = Node.new(2) # data: 2, next_node: nil
    ll.insert_first 2
    assert_equal expected.data, ll.get_last.data
    assert_nil ll.get_last.next_node
    ll.insert_first 1
    assert_equal expected.data, ll.get_last.data
    assert_nil ll.get_last.next_node
  end

  # LinkedList#clear
  def test_empties_out_the_list
    ll = LinkedList.new
    assert_equal 0, ll.size
    ll.insert_first 1
    ll.insert_first 1
    ll.insert_first 1
    ll.insert_first 1
    assert_equal 4, ll.size
    ll.clear
    assert_equal 0, ll.size
  end

  # LinkedList#remove_first
  def test_removes_the_first_node_when_the_list_has_a_size_of_one
    ll = LinkedList.new
    ll.insert_first 'a'
    ll.remove_first
    assert_equal 0, ll.size
    assert_nil ll.get_first
  end

  # LinkedList#remove_first
  def test_removes_the_first_node_when_the_list_has_a_size_of_two
    ll = LinkedList.new
    ll.insert_first 'b'
    ll.insert_first 'a'
    ll.remove_first
    assert_equal 1, ll.size
  end

  # LinkedList#remove_first
  def test_removes_the_first_node_when_the_list_has_a_size_of_three
    ll = LinkedList.new
    ll.insert_first 'c'
    ll.insert_first 'b'
    ll.insert_first 'a'
    ll.remove_first
    assert_equal 2, ll.size
    assert_equal 'b', ll.get_first.data
    ll.remove_first
    assert_equal 1, ll.size
    assert_equal 'c', ll.get_first.data
  end

  # LinkedList#remove_last
  def test_removes_the_last_node_when_the_list_is_empty
    ll = LinkedList.new
    ll.remove_last # Testing that this does not throw an exception
  end

  # LinkedList#remove_last
  def test_removes_the_last_node_when_the_list_is_length_1
    ll = LinkedList.new
    ll.insert_first 'a'
    ll.remove_last
    assert_nil ll.head
  end

  # LinkedList#remove_last
  def test_removes_the_last_node_when_the_list_is_length_2
    ll = LinkedList.new
    ll.insert_first 'b'
    ll.insert_first 'a'
    ll.remove_last
    assert_equal 1, ll.size
    assert_equal 'a', ll.head.data
  end

  # LinkedList#remove_last
  def test_removes_the_last_node_when_the_list_is_length_3
    ll = LinkedList.new
    ll.insert_first 'c'
    ll.insert_first 'b'
    ll.insert_first 'a'
    ll.remove_last
    assert_equal 2, ll.size
    assert_equal 'b', ll.get_last.data
  end

  # LinkedList#insert_last
  def test_adds_to_the_end_of_the_list
    ll = LinkedList.new
    ll.insert_first 'a'
    ll.insert_last 'b'
    assert_equal 2, ll.size
    assert_equal 'b', ll.get_last.data
  end

  # LinkedList#insert_last
  def test_adds_to_the_end_of_an_empty_list
    ll = LinkedList.new
    ll.insert_last 'a' # Testing that this does not throw an exception
  end

  # LinkedList#get_at
  def test_returns_the_node_at_a_given_index
    ll = LinkedList.new
    assert_nil ll.get_at 10
    ll.insert_last 1
    ll.insert_last 2
    ll.insert_last 3
    ll.insert_last 4
    assert_equal 1, ll.get_at(0).data
    assert_equal 2, ll.get_at(1).data
    assert_equal 3, ll.get_at(2).data
    assert_equal 4, ll.get_at(3).data
  end

  # LinkedList#get_at
  def test_get_at_with_empty_list
    ll = LinkedList.new
    assert_nil ll.get_at 0
  end

  # LinkedList#get_at
  def test_get_at_with_out_of_bounds_index_given
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    assert_nil ll.get_at 2
  end

  # LinkedList#remove_at
  def test_remove_at_doesnt_crash_on_an_empty_list
    ll = LinkedList.new
    ll.remove_at # Testing that this does not throw an exception
  end

  # LinkedList#remove_at
  def test_remove_at_doesnt_crash_on_an_index_out_of_bounds
    ll = LinkedList.new
    ll.insert_first 'a'
    ll.remove_at 1 # Testing that this does not throw an exception
  end

  # LinkedList#remove_at
  def test_remove_at_deletes_the_first_node
    ll = LinkedList.new
    ll.insert_last 1
    ll.insert_last 2
    ll.insert_last 3
    ll.insert_last 4
    assert_equal 1, ll.get_at(0).data
    ll.remove_at 0
    assert_equal 2, ll.get_at(0).data
  end

  # LinkedList#remove_at
  def test_remove_at_deletes_the_node_at_the_given_index
    ll = LinkedList.new
    ll.insert_last 1
    ll.insert_last 2
    ll.insert_last 3
    ll.insert_last 4
    assert_equal 2, ll.get_at(1).data
    ll.remove_at 1
    assert_equal 3, ll.get_at(1).data
  end

  # LinkedList#remove_at
  def test_remove_at_works_correctly_on_the_last_node
    ll = LinkedList.new
    ll.insert_last 1
    ll.insert_last 2
    ll.insert_last 3
    ll.insert_last 4
    assert_equal 4, ll.get_at(3).data
    ll.remove_at 3
    assert_nil ll.get_at(3)
  end

  # LinkedList#insert_at
  def test_inserts_a_new_node_with_data_at_the_0_index_when_the_list_is_empty
    ll = LinkedList.new
    ll.insert_at 'hi', 0
    assert_equal 'hi', ll.get_first.data
  end

  # LinkedList#insert_at
  def test_inserts_a_new_node_with_data_at_the_0_index_when_the_list_has_elements
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    ll.insert_last 'c'
    ll.insert_at 'hi', 0
    assert_equal 'hi', ll.get_at(0).data
    assert_equal 'a', ll.get_at(1).data
    assert_equal 'b', ll.get_at(2).data
    assert_equal 'c', ll.get_at(3).data
  end

  # LinkedList#insert_at
  def test_inserts_a_new_node_with_data_at_a_middle_index
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    ll.insert_last 'c'
    ll.insert_last 'd'
    ll.insert_at 'hi', 2
    assert_equal 'a', ll.get_at(0).data
    assert_equal 'b', ll.get_at(1).data
    assert_equal 'hi', ll.get_at(2).data
    assert_equal 'c', ll.get_at(3).data
    assert_equal 'd', ll.get_at(4).data
  end

  # LinkedList#insert_at
  def test_inserts_a_new_node_with_data_at_the_last_index
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    ll.insert_at 'hi', 2
    assert_equal 'a', ll.get_at(0).data
    assert_equal 'b', ll.get_at(1).data
    assert_equal 'hi', ll.get_at(2).data
  end

  # LinkedList#insert_at
  def test_insert_a_new_node_when_index_is_out_of_bounds
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    ll.insert_at 'hi', 30
    assert_equal 'a', ll.get_at(0).data
    assert_equal 'b', ll.get_at(1).data
    assert_equal 'hi', ll.get_at(2).data
  end

  # LinkedList#for_each
  def test_applies_a_transformation_to_each_node
    ll = LinkedList.new
    ll.insert_last 1
    ll.insert_last 2
    ll.insert_last 3
    ll.insert_last 4
    
    ll.for_each { |n| n.data += 10 }
    
    assert_equal 11, ll.get_at(0).data
    assert_equal 12, ll.get_at(1).data
    assert_equal 13, ll.get_at(2).data
    assert_equal 14, ll.get_at(3).data
  end

  # midpoint
  def test_midpoint_returns_the_middle_node_of_an_odd_numbered_list_3
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    ll.insert_last 'c'
    assert_equal 'b', midpoint(ll).data
  end

  # midpoint
  def test_midpoint_returns_the_middle_node_of_an_odd_numbered_list_5
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    ll.insert_last 'c'
    ll.insert_last 'd'
    ll.insert_last 'e'
    assert_equal 'c', midpoint(ll).data
  end

  # midpoint
  def test_midpoint_returns_the_middle_node_of_an_even_numbered_list_2
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    assert_equal 'a', midpoint(ll).data
  end

  # midpoint
  def test_midpoint_returns_the_middle_node_of_an_even_numbered_list_4
    ll = LinkedList.new
    ll.insert_last 'a'
    ll.insert_last 'b'
    ll.insert_last 'c'
    ll.insert_last 'd'
    assert_equal 'b', midpoint(ll).data
  end
end
