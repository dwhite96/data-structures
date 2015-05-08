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
  def find(string) # Inserts if prefix doesn't exist
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
    if node.empty? # Signals end of word
      return string.join
    elsif node.children.head.next.empty?
      string.push(node.child.value)
      node.child.find_suffixes(string)
    else
      node.children.find_next(string)
    end
  end

  def insert_tree(string)
    node = self

    return node if string.empty?

    if node.empty?
      node.insert_value(string.shift) # Create new tree as child
      node.child.insert_tree(string)
    elsif node.child.value != string.first
      node = node.check_next(string)
      string.shift
      node.insert_tree(string)
    elsif node.child.value == string.first
      string.shift
      node.child.insert_tree(string)
    end
  end

  def check_next(string)
    node = self.children.head.check_next(string.first)

    if node == true
      self.insert_value(string.first) # Unshift linked list
      self.child
    else
      node
    end
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
  # Traverse linked list for retrieval (depth-first search)
  def find_next(string)
    result = []
    self.each do |node|
      next_word = []
      next_word.concat(string).push(node.value) # Push search prefix and first node value
      result.push(node.find_suffixes(next_word)) # Push rest of word
    end
    result
  end
end

class LinkedListNode
  # Traverse linked list for insertion (breadth-first search)
  def check_next(char)
    node = self

    if node.next.empty?
      true
    elsif node.next.value.value != char
      node.next.check_next(char)
    elsif node.next.value.value == char
      node.next.value
    end
  end
end
