require './lib/node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(sound)
    node = Node.new(sound)
    if @head.nil?
      @head = node
    else
      last_node.next_node = node
    end
    node.data
  end

  def count
    @head.nil? ? 0 : count_nodes
  end

  def prepend(sound)
    node = Node.new(sound)
    old_head = @head
    @head = node
    @head.next_node = old_head
  end

  def count_nodes
    tally = 1
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      tally += 1
    end
    tally
  end

  def to_string
    current_node = @head
    current_node.nil? ? '' : list_to_string(current_node)
  end

  def last_node
    if @head.nil?
      @head
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node
    end
  end

  def list_to_string(current_node)
    output = current_node.data
    until current_node.next_node.nil?
      current_node = current_node.next_node
      output += (' ' + current_node.data)
    end
    output
  end

  def find_node(index)
    pos = 0
    current_node = @head
    while pos < index
      current_node = current_node.next_node
      pos += 1
    end
    current_node
  end

  def insert(index, sound)
    node = Node.new(sound)
    node_before_insert = find_node(index - 1)
    node_after_insert = find_node(index)
    node_before_insert.next_node = node
    node.next_node = node_after_insert
  end

  def find(index, length)
    current_node = find_node(index)
    result = current_node.data
    (length - 1).times do
      current_node = current_node.next_node
      result += ' ' + current_node.data
    end
    result
  end

  def include?(sound)
    current_node = @head
    until current_node.nil?
      return true if current_node.data == sound

      current_node = current_node.next_node
      end
    false
  end

  def pop
    old_last_node = last_node
    new_last_node = find_node(count - 2)
    new_last_node.next_node = nil
    old_last_node.data
  end
end
