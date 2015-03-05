require "pp"

# Implement a basic (recursive) Binary Tree

def BinaryTree(*args)
  BinaryTree.build(*args)
end

# For traversal, see
# http://en.wikipedia.org/wiki/Tree_traversal#Implementations

class BinaryTree
  include Enumerable

  attr_accessor :value, :left, :right

  def self.build(value = :empty, left = :empty, right = :empty)
    case value
    when BinaryTree
      value
    when :empty
      BinaryTree.empty
    else
      BinaryTree.new(value, left, right)
    end
  end

  def self.empty
    EmptyTree.new
  end

  def initialize(value = :empty, left = :empty, right = :empty)
    @value = value
    @left = BinaryTree.build(left)
    @right = BinaryTree.build(right)
  end

  def empty?
    false
  end

  def each(&block)
    pre_order(&block)
  end

  # Implement pre-order traversal of the tree
  def pre_order(&block)
    block.call(self.value)
    left.pre_order(&block)
    right.pre_order(&block)
  end

  # Implement in-order traversal of the tree
  def in_order(&block)
    left.in_order(&block)
    block.call(self.value)
    right.in_order(&block)
  end

  # Implement post-order traversal of the tree
  def post_order(&block)
    left.post_order(&block)
    right.post_order(&block)
    block.call(self.value)
  end
end

class EmptyTree < BinaryTree
  def initialize(value = :empty, left = :empty, right = :empty)
    @value = :empty
    @left  = :empty
    @right = :empty
  end

  def pre_order(&block);  end
  def in_order(&block);   end
  def post_order(&block); end

  def empty?
    true
  end
end

b = BinaryTree(9)
b.left = BinaryTree(4)
b.left.left = BinaryTree(54)
b.left.right = BinaryTree(32)

b.right = BinaryTree("apples") # This is to ensure it works with different types
b.right.left = BinaryTree(13)
b.right.left.left = BinaryTree(5)
b.right.left.left.left = BinaryTree(5)
b.right.right = BinaryTree(78)
b.right.right.right = BinaryTree(29)

p PP.pp(b)
p b.post_order { |i| puts i }
p b.max
