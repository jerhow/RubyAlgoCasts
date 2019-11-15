# ruby -I lib:test test_bst.rb -v

require 'minitest/autorun'
require './bst.rb'

class TestBst < MiniTest::Unit::TestCase
  def setup
  end

  # Node#insert
  def test_node_can_insert_correctly
    node = Node.new(10)
    node.insert 5
    node.insert 15
    node.insert 17

    assert_equal 5, node.left.key
    assert_equal 15, node.right.key
    assert_equal 17, node.right.right.key
  end

  # Node#contains
  def test_contains_returns_node_with_the_same_key
    node = Node.new(10)
    node.insert 5
    node.insert 15
    node.insert 20
    node.insert 0
    node.insert -5
    node.insert 3

    three = node.left.left.right
    assert_equal three, node.contains(3)
  end

  # Node#contains
  def test_contains_returns_null_if_value_not_found
    node = Node.new(10)
    node.insert 5
    node.insert 15
    node.insert 20
    node.insert 0
    node.insert -5
    node.insert 3

    assert_nil node.contains(9999)
  end
end
