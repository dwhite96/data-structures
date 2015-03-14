require_relative "binary_tree"

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time

class BinarySearchTree < BinaryTree
  def include?(value)
    return true if value == @value
    if value < @value
      return false if @left.empty?
      @left.include?(value)
    elsif value > @value
      return false if @right.empty?
      @right.include?(value)
    end
  end

  def insert(value)
    if value < @value
      if @left.empty?
        @left = BinarySearchTree.new(value)
      else
        @left.insert(value)
      end
    elsif value > @value
      if @right.empty?
        @right = BinarySearchTree.new(value)
      else
        @right.insert(value)
      end
    end

    self
  end

  # Look for max value that is smaller than value to be removed and replace
  #   removed value with that max value. Max tree should be replaced with
  #   EmptyTree if leaf or with left node if that node holds a value.

  def remove(value)
    if value == @value
      @value = self.left.max.value  # Mutates existing object
      self.left.max = EmptyTree.new  # This doesn't work
    elsif value < @value
      return false if @left.empty? # Need to change this line to raise error
      @left.remove(value)
    elsif value > @value
      return false if @right.empty?
      @right.remove(value)
    end

    self
  end

  def empty?
    false
  end

  def min
    return self if @left.empty?
    @left.max
  end

  def max
    return self if @right.empty?
    @right.max
  end
end
