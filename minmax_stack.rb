require_relative "linked_list"

# Implement a "min-max stack" - a stack that has contant-time
# "maximum" _and_ "minimum" operations.

class MinMaxStack
  class UnderflowError < StandardError; end

  def initialize
    @list = LinkedList.new
    @current_max = 0
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
    if item > @current_max
      @current_max = item
      value << @current_max
    else
      value << @current_max
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
      @current_min = @list.head.value[1]
    end
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
