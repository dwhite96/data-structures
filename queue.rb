require_relative 'linked_list'
# Implement a Queue using a linked list
# Note:
#   1. All operations should take O(1) time
#   2. You'll need to modify the LinkedList to achieve constant
#      time enqueue and dequeue operations.

class Queue
  class UnderflowError < StandardError; end

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
