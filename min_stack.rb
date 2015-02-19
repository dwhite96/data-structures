require_relative 'linked_list'

# Implement a "min stack" - a stack that has a contant-time
# "minimum" operations.

class MinStack
  class UnderflowError < StandardError; end

  def initialize
    @list = LinkedList.new
  end

  def push(item)
    value = []
    if empty?
      @current_min = item
      value << @current_min << @current_min
    elsif item < @current_min
      @current_min = item
      value << @current_min << @current_min
    else
      value << item << @current_min
    end
    @list.unshift(value)
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

  # Returns the smallest item on the stack
  # O(1) time
  def min
    if empty?
      @current_min = nil
    else
      @current_min = @list.head.value.last
    end
  end
end
