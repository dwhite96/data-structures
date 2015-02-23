require_relative "stack"

# Implement a "min stack" - a stack that has a contant-time
# "minimum" operations.

class MinStack < Stack
  def push(item)
    @list.unshift([item, least(item, self.min)])
  end

  def pop
    fail UnderflowError, "Stack is empty" if empty?
    @list.shift[0]
  end

  def peek
    full_peek[0]
  end

  # Returns the smallest item on the stack
  # O(1) time
  def min
    full_peek[1]
  end

  private

  def full_peek
    return [nil, nil] if self.empty?

    @list.head.value
  end

  def least(x, y)
    return x if y.nil?

    [x, y].min
  end
end
