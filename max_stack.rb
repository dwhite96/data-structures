require_relative 'linked_list'

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.

class MaxStack
  class UnderflowError < StandardError; end

  def initialize
    @list = LinkedList.new
  end

  def push(item)
    @list.unshift(item)
  end

  def pop
    fail UnderflowError, "Stack is empty" if empty?
    @list.shift
  end

  def peek
    @list.head.value
  end

  def empty?
    @list.empty?
  end

  def size
    @list.length
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    max_so_far = peek
    @list.each do |item|
      if item > max_so_far
        max_so_far = item
      end
    end
    max_so_far
  end
end
