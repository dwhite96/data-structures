require_relative 'linked_list'

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.

class MaxStack
  class UnderflowError < StandardError; end

  def initialize
    @list = LinkedList.new
    @current_max = 0
  end

  def push(item)
    @list.unshift(item)
    max
  end

  def pop
    fail UnderflowError, "Stack is empty" if empty?
    @list.shift
    max
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
    if peek > @current_max
      @current_max = peek
    end
    @current_max
  end
end
