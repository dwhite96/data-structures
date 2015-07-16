require_relative "stack"

# Implement a queue using two stacks

class StackQueue
  class UnderflowError < StandardError; end

  def initialize
    @stack_1 = Stack.new
    @stack_2 = Stack.new
  end

  def enqueue(item)
    @stack_1.push(item)
  end

  def dequeue
    fail UnderflowError, "Queue is empty" if empty?
    empty_stack_2
    @stack_2.pop
  end

  def peek
    empty_stack_2
    @stack_2.peek
  end

  def empty?
    @stack_1.empty? && @stack_2.empty?
  end

  def size
    @stack_1.size + @stack_2.size
  end

  private

  def empty_stack_2
    if @stack_2.empty?
      stack_swap
    end
  end

  def stack_swap
    until @stack_1.empty?
      @stack_2.push(@stack_1.pop)
    end
  end
end
