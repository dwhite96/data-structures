require "pp"

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
    self.each do |node|
      if node == value
        return true
      else
        next
      end
    end
  end

  def insert(value)
    if @value == :empty
      @value = value
    elsif value < @value
      if @left.class == EmptyTree
        @left = BinarySearchTree.new(value)
      else
        @left.insert(value)
      end
    else value > @value
      if @right.class == EmptyTree
        @right = BinarySearchTree.new(value)
      else
        @right.insert(value)
      end
    end

    self
  end

  def empty?
    self.value.nil?
  end
end

b = BinarySearchTree.new(9)
b.insert(17)
b.insert(54)
b.insert(32)
b.insert(13)
b.insert(4)
b.insert(5)
b.insert(5)
b.insert(78)
b.insert(29)

PP.pp(b)

p b.include?(32)
p b.include?(6)
