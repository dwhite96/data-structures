require_relative 'linked_list'

# Implement a Stack class using a linked list

class Stack
  class UnderflowError < StandardError; end
  def initialize
    @stack = LinkedList.new
  end

  # Places +item+ on the top of the stack
  # O(1) time
  def push(item)
    @stack.unshift(item)
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  # O(1) time
  def pop
    @stack.shift
  end

  # Return the item on the top of the stack without removing it
  # O(1) time
  def peek
  end

  # Return true if the stack is empty and false otherwise
  # O(1) time
  def empty?
  end

  # Return the number of items on the stack
  # O(1) time
  def size
  end
end


# Stack representation #1 using a linked list. "Top" of stack is at head node.
# H = Head, v = value, n = next or "pointer"

# Rules: Head node value changes with push or pop method calls.

# Initialize stack (may be initialized as empty or nil value stack, or with first actual value):

#  H node
# ---------
# | v | n |   (nil value)
# ---------

# Push new item, '1', on "empty" stack (change empty head node to head node with actual value):

#  H node
# ---------
# | 1 | n |
# ---------

# Push next item, '2', to head node(top) of stack:

#  H node       n node
# ---------    ---------
# | 2 | n |->  | 1 | n |
# ---------    ---------

# Push next item, '3', to head node(top) of stack:

#  H node       n node       n node
# ---------    ---------    ---------
# | 3 | n |->  | 2 | n |->  | 1 | n |
# ---------    ---------    ---------

# Pop item, '3', off of head node(top) of stack:

#  H node       n node
# ---------    ---------
# | 2 | n |->  | 1 | n |
# ---------    ---------



# Stack representation #2 using a linked list. "Top" of stack is at tail.
# H = Head, v = value, n = next or "pointer"

# Rules: Head node value should not move or change unless changing to 'nil' when base case.
#        Values can only be added or removed off of end of stack.

# Initialize stack (may be initialized as empty or nil value stack, or with first actual value):

#  H node
# ---------
# | v | n |   (nil value)
# ---------

# Push new item, '1', on "empty" stack (change empty head node to head node with actual value):

#  H node
# ---------
# | 1 | n |
# ---------

# Push next item, '2', on end(top) of stack:

#  H node       n node
# ---------    ---------
# | 1 | n |->  | 2 | n |
# ---------    ---------

# Push next item, '3', on end(top) of stack:

#  H node       n node       n node
# ---------    ---------    ---------
# | 1 | n |->  | 2 | n |->  | 3 | n |
# ---------    ---------    ---------

# Pop item, '3', off of end(top) of stack:

#  H node       n node
# ---------    ---------
# | 1 | n |->  | 2 | n |
# ---------    ---------
