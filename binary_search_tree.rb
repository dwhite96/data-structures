require_relative "binary_tree"

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time

class BinarySearchTree < BinaryTree
  def self.empty
    EmptyBinarySearchTree.new
  end

  def initialize(value, left = :empty, right = :empty)
    @value = value
    @left = EmptyBinarySearchTree.new(left)
    @right = EmptyBinarySearchTree.new(right)
  end

  def include?(value)
    return true if value == self.value
    if value < self.value
      return false if self.left.empty?
      self.left.include?(value)
    elsif value > self.value
      return false if self.right.empty?
      self.right.include?(value)
    end
  end

  def insert(value)
    if value < self.value
      if self.left.empty?
        self.left = BinarySearchTree.new(value)
      else
        self.left.insert(value)
      end
    elsif value > self.value
      if self.right.empty?
        self.right = BinarySearchTree.new(value)
      else
        self.right.insert(value)
      end
    end

    self
  end

  # Look for max value that is smaller than value to be removed and replace
  #   removed value with that max value. Max tree should be replaced with
  #   EmptyTree if leaf or with left node if that node holds a value.

  def remove(value)
    if value < self.value
      self.left = self.left.remove(value) if self.has_left_child?
      return self
    elsif value > self.value
      self.right = self.right.remove(value) if self.has_right_child?
      return self
    end

    # +self+ is the node we want to remove
    case self.children_count
    when 0
      BinarySearchTree.empty
    when 1
      if self.has_left_child?
        self.left
      elsif self.has_right_child?
        self.right
      end
    when 2
      left_max   = self.left.max.value
      self.value = left_max
      self.left  = left.remove(left_max)
      self
    end
  end

  def has_left_child?
    self.left.empty? ? false : true
  end

  def has_right_child?
    self.right.empty? ? false : true
  end

  def empty?
    false
  end

  def children_count
    if left.empty? && right.empty?
      0
    elsif left.empty? || right.empty?
      1
    elsif !left.empty? && !right.empty?
      2
    end
  end

  def min
    return self if self.left.empty?
    self.left.max
  end

  def max
    return self if self.right.empty?
    self.right.max
  end
end

class EmptyBinarySearchTree < BinarySearchTree
  def initialize(value = :empty, left = :empty, right = :empty)
    @value = :empty
    @left  = :empty
    @right = :empty
  end

  def pre_order(&block);  end
  def in_order(&block);   end
  def post_order(&block); end

  def min; end

  def max; end

  def empty?
    true
  end
end
