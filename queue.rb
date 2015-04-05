require_relative "linked_list"
# Implement a Queue using a linked list
# Note:
#   1. All operations should take O(1) time
#   2. You'll need to modify the LinkedList to achieve constant
#      time enqueue and dequeue operations.

class LinkedList
  attr_reader :head, :tail, :length

  def initialize
    @head = LinkedListNode.new(nil)
    @tail = @head
    @length = 0
  end

  # O(1) time
  def append(value)
    if empty?
      @head = @head.insert_before(value)
      @tail = @head
    else
      @tail = @tail.insert_after(value)
    end
    @length += 1

    self
  end
end

class Queue
  class UnderflowError < StandardError; end

  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  # Places +item+ at the back of the queue
  def enqueue(item)
    @list.append(item)
  end

  # Removes the item at the front of the queue and returns it
  # Raises an error if the queue is empty
  def dequeue
    fail UnderflowError, "Queue is empty" if empty?
    @list.shift
  end

  # Return the item at the front of the queue without dequeing it
  def peek
    @list.head.value
  end

  # Return true if the queue is empty and false otherwise
  def empty?
    @list.empty?
  end

  # Return the number of items on the stack
  def size
    @list.length
  end
end
