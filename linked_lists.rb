class LinkedLists
  def initialize(data = nil)
    @head = Node.new
    @head.value = data
  end

  def append(data)
    if @head.value == nil
      @head.value = data
    else
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new
      current_node.next_node.value = data
    end
  end

  def prepend(data)
    if @head.value == nil
      @head.value = data
    else
      head_value = @head.value
      head_next_node = @head.next_node
      @head.value = data
      @head.next_node = Node.new
      @head.next_node.value = head_value
      @head.next_node.next_node = head_next_node
    end
  end

  def size
    return 0 if @head.value == nil
    counter = 1
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
      counter += 1
    end
    counter
  end

  def head
    @head.value
  end

  def tail
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.value
  end

  def at(index)
    return nil if index + 1 > self.size
    current_node = @head
    index.times do
      current_node = current_node.next_node
    end
    current_node.value
  end

  def pop
    @head.value = nil if self.size == 1
    current_node = @head
    (self.size-2).times do
      current_node = current_node.next_node
    end
    current_node.next_node = nil
  end

  def contains?(data)
    current_node = @head
    while current_node != nil
      if current_node.value == data
        return true
      else
        current_node = current_node.next_node
      end
    end
    false
  end

  def find(data)
    current_node = @head
    counter = 0
    while current_node != nil
      if current_node.value == data
        return counter
      else
        current_node = current_node.next_node
        counter += 1
      end
    end
    return nil
  end

  def to_s
    current_node = @head
    string = ""
    while current_node != nil
      string << "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string << "nil"
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

my_list = LinkedLists.new("item 3")
my_list.prepend("item 2")
my_list.prepend("item 1")
my_list.append("item 4")
#puts my_list.to_s
puts my_list.contains?("item 1")
