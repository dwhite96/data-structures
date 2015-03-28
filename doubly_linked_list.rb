class DoublyLinkedList
  class UnderflowError < StandardError; end

  include Enumerable

  attr_reader :head, :tail, :length

  def initialize
    @head = DoublyLinkedListNode.new(nil)
    @tail = DoublyLinkedListNode.new(nil)
    @length = 0
  end

  # O(1) time
  def unshift(value)
    @head = @head.insert_before(value)
    @length += 1

    if @length == 1
      @head.next = @tail  # Single node should be both head and tail
      @tail = @head
    end

    self
  end

  # O(1) time
  def shift
    fail UnderflowError, "List is empty" if empty?
    result = @head.value

    if @length == 1
      @head = @head.previous
      @tail = @tail.next
    else
      @head.next.previous = @head.previous
      @head = DoublyLinkedListNode(@head.next)
    end

    @length -= 1
    result
  end

  # O(1) time
  def empty?
    self.head.empty?
  end

  def each(&block)
    node = self.head

    until node.empty?
      block.call(node.value)
      node = node.next
    end

    self
  end
end

def DoublyLinkedListNode(value)
  case value
  when DoublyLinkedListNode
    value
  else
    DoublyLinkedListNode.new(value)
  end
end

class DoublyLinkedListNode
  include Enumerable

  attr_accessor :previous, :value, :next

  def initialize(value = nil, previous_node = nil, next_node = nil)
    @previous = previous_node
    @value    = value
    @next     = next_node
  end

  # O(1) time
  # Insert +value+ after this DoublyLinkedListNode and return new DoublyLinkedListNode
  def insert_after(value)
    node = DoublyLinkedListNode(value)

    # Need to implement this

    node
  end

  # O(1) time
  # Insert +value+ before this DoublyLinkedListNode and return new DoublyLinkedListNode
  def insert_before(value)
    node = DoublyLinkedListNode(value)

    if self.empty?
      node.previous = self
    else
      node.previous = self.previous
      node.next     = self
      self.previous = node
    end

    node
  end

  def empty?
    value.nil?
  end
end
