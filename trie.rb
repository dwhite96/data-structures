require_relative "tree"
require "PP"

# Implement a Trie (sometimes called a "prefix tree")
# See: http://en.wikipedia.org/wiki/Trie
#
# A Trie allows for efficient prefix searching, i.e.,
# "Find me all things that start with 'Foo'"

class Trie
  attr_reader :root

  def initialize
    @root = Tree.new(nil)
  end

  # O(m) time
  # def find(string)
  #   result = string.scan(/\w/) # Split string into array without spaces
  #   self.insert(result)

  #   result
  # end

  # O(m) time
  def insert(string)
    string = string.scan(/\w/) # Split string into array without spaces
    self.root.insert_tree(string)
  end

  def empty?
    root.empty?
  end
end

class Tree
  # Insert entire string or appropriate suffix of string in trie.
  def insert_tree(string)
    node = self

    return self if string.empty?

    if node.empty?
      node.insert_value(string.shift) # Create new tree as child
    elsif node.child.value != string.first
      node.children.add_next(string)
    elsif node.child.value == string.first
      string.shift
    end
    node.child.insert_tree(string)

    self
  end

  def insert_value(char)
    self.add_child(char)
  end

  def child
    children.head.value
  end

  def empty?
    children.empty?
  end
end

class LinkedList
  def add_next(string)
    # @length += 1 unless self.head.next.value.value == string.first
    self.head.add_next(string)
  end
end

class LinkedListNode
  def add_next(string)
    node = self

    if node.next.empty?
      node.insert_after(Tree(string.shift)) # Create new tree as next
    elsif node.next.value.value != string.first
      node.next.add_next(string)
    elsif node.next.value.value == string.first
      string.shift
    end
    node.next.value.insert_tree(string)

    self
  end
end
