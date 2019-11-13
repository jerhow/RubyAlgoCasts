# ruby -I lib:test test_tree.rb -v

require 'minitest/autorun'
require './tree.rb'

class TestTree < MiniTest::Unit::TestCase
  def setup
  end

  # Node
  def test_node_has_data_and_children_properties
    node = Node.new('a')
    assert_equal 'a', node.data
    assert_equal 0, node.children.length
  end

  # Node
  def test_node_can_add_children
    node = Node.new('a')
    node.add 'b'
    assert_equal 1, node.children.length
    assert_equal 0, node.children[0].children.length
  end

  # Node
  def test_node_can_remove_children
    node = Node.new('a')
    node.add 'b'
    assert_equal 1, node.children.length
    node.remove 'b'
    assert_equal 0, node.children.length
  end

  # Tree
  def test_tree_starts_empty
    t = Tree.new
    assert_nil t.root
  end

  # Tree
  def test_can_traverse_breadth_first
    letters = []
    t = Tree.new
    t.root = Node.new('a')
    t.root.add 'b'
    t.root.add 'c'
    t.root.children[0].add 'd'

    t.traverse_bf { |node| letters << node.data }
    assert_equal ['a', 'b', 'c', 'd'], letters
  end

  # Tree
  def test_can_traverse_depth_first
    letters = []
    t = Tree.new
    t.root = Node.new('a')
    t.root.add 'b'
    t.root.add 'd'
    t.root.children[0].add 'c'

    t.traverse_df { |node| letters << node.data }
    assert_equal ['a', 'b', 'c', 'd'], letters
  end
end
