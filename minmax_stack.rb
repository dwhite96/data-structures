require_relative "stack"

# Implement a "min-max stack" - a stack that has contant-time
# "maximum" _and_ "minimum" operations

class MinMaxStack < Stack
  def push(item)
    @list.unshift([item, least(item, self.min), most(item, self.max)])
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

  # Returns the largest item on the stack
  # O(1) time
  def max
    full_peek[2]
  end

  private

  def full_peek
    return [nil, nil, nil] if self.empty?

    @list.head.value
  end

  def least(x, y)
    return x if y.nil?

    [x, y].min
  end

  def most(x, y)
    return x if y.nil?

    [x, y].max
  end
end
