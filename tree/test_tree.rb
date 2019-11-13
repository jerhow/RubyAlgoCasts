# ruby -I lib:test test_tree.rb -v

require 'minitest/autorun'
require './tree.rb'

class TestTree < MiniTest::Unit::TestCase
  def setup
  end

  def test_node_has_data_and_children_properties
    node = Node.new('a')
    assert_equal 'a', node.data
    assert_equal 0, node.children.length
  end

  def test_node_can_add_children
    node = Node.new('a')
    node.add 'b'
    assert_equal 1, node.children.length
    assert_equal 0, node.children[0].children.length
  end

  def test_node_can_remove_children
    node = Node.new('a')
    node.add 'b'
    assert_equal 1, node.children.length
    node.remove 'b'
    assert_equal 0, node.children.length
  end
end
