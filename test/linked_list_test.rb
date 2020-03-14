require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def setup
    @linked_list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @linked_list
  end

  def test_it_has_attributes
    assert_nil @linked_list.head
  end

  def test_it_can_append
    assert_nil @linked_list.head
    @linked_list.append('doop')
    assert_nil @linked_list.head.next_node
  end

  def test_it_can_count_nodes
    assert_equal 0, @linked_list.count
    @linked_list.append('doop')
    assert_equal 1, @linked_list.count
    @linked_list.append('deep')
    assert_equal 2, @linked_list.count
  end

  def test_it_can_return_a_string
    assert_equal '', @linked_list.to_string
    @linked_list.append('doop')
    @linked_list.append('deep')
    assert_equal 'doop deep', @linked_list.to_string
  end

  def test_it_can_return_a_string_if_given_a_starting_node
    @linked_list.append('doop')
    @linked_list.append('deep')
    assert_equal 'doop deep', @linked_list.list_to_string(@linked_list.head)
  end

  def test_it_can_get_to_the_last_node
    @linked_list.append('doop')
    @linked_list.append('deep')
    @linked_list.append('dap')
    assert_equal 'dap', @linked_list.last_node.data
  end

  def test_it_can_prepend
    @linked_list.append('doop')
    @linked_list.append('deep')
    @linked_list.prepend('dap')
    assert_equal 'dap doop deep', @linked_list.to_string
    assert_equal 3, @linked_list.count
  end

  def test_it_can_find_a_node_with_its_position
    @linked_list.append('doop')
    @linked_list.append('deep')
    @linked_list.append('dap')
    assert_equal 'deep', @linked_list.find_node(1).data
    assert_equal 'doop', @linked_list.find_node(0).data
    assert_equal 'dap', @linked_list.find_node(2).data
  end

  def test_it_can_insert_nodes
    @linked_list.append('doop')
    @linked_list.append('deep')
    @linked_list.append('dap')
    @linked_list.insert(1, 'woo')
    assert_equal 'doop woo deep dap', @linked_list.to_string
    assert_equal 4, @linked_list.count
  end

  def test_it_can_return_segments_of_the_list
    @linked_list.append('doop')
    @linked_list.append('deep')
    @linked_list.append('dap')
    @linked_list.append('shi')
    @linked_list.append('prout')
    assert_equal 'deep dap shi', @linked_list.find(1, 3)
  end

  def test_it_can_check_if_an_element_is_in_the_list
    @linked_list.append('doop')
    @linked_list.append('deep')
    @linked_list.append('dap')
    @linked_list.append('shi')
    assert_equal true, @linked_list.include?('dap')
    assert_equal false, @linked_list.include?('dope')
  end

  def test_it_can_pop_the_last_element
    @linked_list.append('doop')
    @linked_list.append('deep')
    @linked_list.append('dap')
    @linked_list.append('shi')
    @linked_list.pop
    assert_equal 'dap', @linked_list.last_node.data
    assert_equal 3, @linked_list.count
    @linked_list.pop
    assert_equal 'deep', @linked_list.last_node.data
    assert_equal 2, @linked_list.count
    assert_equal 'doop deep', @linked_list.to_string
  end

  def test_it_can_add_another_test 
  end
end
