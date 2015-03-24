
def new_tree(node, root_value)
  tree = BinarySearchTree.new(root_value)
  p tree
  values = []
  node.each do |value|
    values << value
  end
  p values
  values.each do |value|
    p value
    tree.insert(value)
  end
  tree
end

