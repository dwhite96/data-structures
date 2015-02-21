require_relative "linked_list"

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.

class MaxStack
  class UnderflowError < StandardError; end

  def initialize
    @list = LinkedList.new
    @current_max = 0
  end

  def push(item)
    value = []
    if item > @current_max
      @current_max = item
      value << @current_max << @current_max
      @list.unshift(value)
    else
      value << item << @current_max
      @list.unshift(value)
    end
  end

  def pop
    fail UnderflowError, "Stack is empty" if empty?
    @list.shift.first
  end

  def peek
    empty? ? @list.head.value : @list.head.value.first
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
    if empty?
      @current_max = 0
    else
      @current_max = @list.head.value.last
    end
  end
end
