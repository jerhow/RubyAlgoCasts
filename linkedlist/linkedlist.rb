class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert_first(data)
    # Creates a new node with a next_node of whatever is currently
    # the list head (even if it's nil), and assigns the new node
    # as the new list head.
    @head = Node.new(data, @head)
  end

  def size
    counter = 0
    node = @head

    while node
      counter += 1
      node = node.next_node
    end

    counter
  end

  def get_first
    @head
  end

  def get_last
    node = @head

    while node && node.next_node
      node = node.next_node
    end

    node
  end

  def clear
    @head = nil
  end

  def remove_first
    return nil if !@head
    @head = @head.next_node
  end

  def remove_last
    return nil if @head.nil?
    return @head = nil if @head.next_node.nil?

    node = @head
    previous = nil

    while node.next_node
      previous = node
      node = node.next_node
    end

    previous.next_node = nil
  end

  def insert_last(data)
    last = get_last
    if last
      last.next_node = Node.new(data)
    else
      insert_first(data)
    end
  end

  def get_at(idx = 0)
    node = @head
    counter = 0
    
    while node
      return node if counter == idx
      counter += 1
      node = node.next_node
    end

    nil
  end

  def remove_at(idx = 0)
    return nil if @head.nil? || idx < 0

    if idx == 0
      @head = @head.next_node
      return nil
    end

    previous = get_at(idx - 1)
    return nil if previous.nil?
    
    target = previous.next_node
    
    if target
      previous.next_node = target.next_node
    else
      previous.next_node = nil
    end

    nil
  end

  def insert_at(data, idx)
    if @head.nil? || idx == 0
      insert_first(data)
      return nil
    end

    previous = get_at(idx - 1)
    if previous.nil?
      insert_last(data)
      return nil
    end

    new_node = Node.new(data)
    at_idx = previous.next_node
    if at_idx
      new_node.next_node = previous.next_node
    end
    previous.next_node = new_node

    nil
  end

  # Calls the provided block for every node of the linked list
  def for_each(&block)
    node = @head

    while node
      yield node
      node = node.next_node
    end

    nil
  end
end
