require './lib/linked_list'

class JungleBeat

  attr_reader :list
  
  def initialize
    @list = LinkedList.new
  end 

  def append(sounds)
    sounds.split.each do |sound|
      list.append(sound)
    end
    sounds
  end

  def play 
    `say -r 500 #{list.to_string}`
  end

  def try_this
  end
  
end