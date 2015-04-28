require_relative "linked_list"

def Tree(value)
  case value
  when Tree
    value
  else
    Tree.new(value)
  end
end

# Implement a generic tree class.  Each node
# is also a Tree and can have any number of children.
class Tree
  attr_reader :value, :children

  def initialize(value)
    @value    = value
    @children = LinkedList.new
  end

  # Add a new child to this node
  # O(1) time
  def add_child(value)
    @children.unshift(Tree(value))
  end

  def each(&block)
    node = self.children.head.value

    until node.nil?
      block.call(node.value)
      node = node.children.head.value
    end

    self
  end

  # def each(&block)
  #   node = self.head

  #   until node.empty?
  #     block.call(node.value)
  #     node = node.next
  #   end

  #   self
  # end
end
