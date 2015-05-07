require_relative "tree"

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
  def find(string)
    result = string.scan(/\w/) # Split string into array without spaces
    self.insert(string).find_suffixes(result)
  end

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
  def find_suffixes(string)
    node = self
    result = string

    if node.empty? # Signals end of word
      return string.join
    elsif node.children.head.next.empty? # Does node branch to new word?
      string.push(node.child.value)
      p string
      node.child.find_suffixes(string)
    else
      result.concat(node.children.find_next(string))
    end
  end

  def insert_tree(string)
    node = self

    return node if string.empty?

    if node.empty?
      node.insert_value(string.shift) # Create new tree as child
    elsif node.child.value != string.first
      node = node.children.add_next(string)
      string.shift
      node.insert_tree(string)
      return node if string.empty?
    elsif node.child.value == string.first
      string.shift
    end

    node.child.insert_tree(string)
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
    self.head.add_next(string)
  end

  # Traverse linked list for retrieval(breadth-first search)
  def find_next(next_result)
    result = []
    self.each do |node|
      result.push(node.find_suffixes(next_result))
    end
    result
  end
end

class LinkedListNode
  # Traverse linked list for insertion(breadth-first search)
  def add_next(string)
    node = self

    if node.next.empty?
      node.insert_after(Tree(string.first)) # Create new tree as next
      node.next.value
    elsif node.next.value.value != string.first
      node.next.add_next(string)
    elsif node.next.value.value == string.first
      node.next.value
    end
  end
end
