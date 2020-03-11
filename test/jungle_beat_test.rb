require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test 

  def setup
    @jungle = JungleBeat.new
  end

  def test_it_exists
    assert_instance_of JungleBeat, @jungle
  end

  def test_it_has_attributes
    assert_instance_of LinkedList, @jungle.list 
  end

  def test_it_can_append_multiple_sounds_at_once
    @jungle.append("deep doop dap")
    assert_equal 3, @jungle.list.count
    assert_equal "dap", @jungle.list.last_node.data 
    @jungle.append("woo hoo shu")
    assert_equal 6, @jungle.list.count
    assert_equal "deep doop dap woo hoo shu", @jungle.list.to_string
  end

  def test_it_can_play_some_beats
    @jungle.append("deep doo ditt woo hoo shu")
    @jungle.play
  end

end