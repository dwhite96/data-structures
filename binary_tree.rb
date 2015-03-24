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

  def initialize(value, left = :empty, right = :empty)
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

  def insert(value); end

  def empty?
    true
  end
end
