require_relative 'linked_list'

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.

class MaxStack
  class UnderflowError < StandardError; end

  def initialize
    @list = LinkedList.new
    @current_max = 0
  end

  # Places item on top of stack if greater than current max
  # O(1) time
  def push(item)
    @list.unshift(item) if item > @current_max
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
    empty? ? @current_max = 0 : @current_max = peek
  end
end
