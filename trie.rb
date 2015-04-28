require_relative "tree"
require "PP"

# Implement a Trie (sometimes called a "prefix tree")
# See: http://en.wikipedia.org/wiki/Trie
#
# A Trie allows for efficient prefix searching, i.e.,
# "Find me all things that start with 'Foo'"

class LinkedList
  def add_next(string)
    # @length += 1 unless self.head.next.value.value == string.first
    self.head.add_next(string)
  end

  def traverse_tree(string)
    self.head.value.insert_tree(string)
  end
end

class LinkedListNode
  def add_next(string)
    node = self

    if node.next.empty?
      p "add character #{string.first} to next #{node}"
      node.insert_after(Tree(string.shift)) # Create new tree as next
      node.next.value.check_base_tree(string)
    elsif node.next.value.value != string.first
      node.next.add_next(string)
    elsif node.next.value.value == string.first
      p "character already in next #{string.first}"
      string.shift
      node.next.value.check_base_tree(string)
    end

    self
  end
end

class Tree
  def check_base_tree(string)
    node = self

    return self if string.empty?

    if node.empty?
      p "add #{string.first} to empty"
      node.insert_value(string.first)
    elsif node.children.head.value.value != string.first
      node.children.add_next(string)
    end
    node.children.traverse_tree(string)
  end

  # Insert entire string or appropriate suffix of string in trie.
  def insert_tree(string)
    node = self

    return self if string.empty?

    if node.value != string.first
      p "does line 64 ever run?"
      node.children.add_next(string)
    elsif node.empty?
      p "line 67 just ran"
      string.shift
      p string
      return self if string.empty?
      p "add character #{string.first}"
      node.insert_value(string.first)
      p string
    elsif node.value == string.first
      p "character already here #{string.first} #{node}"
      string.shift
      p string
    end
    node.check_base_tree(string)

    self
  end

  def insert_value(char)
    self.add_child(char)
  end

  def empty?
    children.empty?
  end
end

class Trie
  attr_reader :root

  def initialize
    @root = Tree.new(nil)
  end

  # O(m) time
  def find_prefix(value)
    value = value.scan(/\w/) # Split string into array without spaces
    result = []
    value.each do |char|
      self.root.insert_char(char)
    end

    result
  end

  # O(m) time
  def insert(string)
    string = string.scan(/\w/) # Split string into array without spaces
    self.root.check_base_tree(string)
  end
end
