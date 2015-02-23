require_relative "stack"

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.

class MaxStack < Stack
  def push(item)
    @list.unshift([item, most(item, self.max)])
  end

  def pop
    fail UnderflowError, "Stack is empty" if empty?
    @list.shift[0]
  end

  def peek
    full_peek[0]
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    full_peek[1]
  end

  private

  def full_peek
    return [nil, nil] if self.empty?

    @list.head.value
  end

  def most(x, y)
    return x if y.nil?

    [x, y].max
  end
end
