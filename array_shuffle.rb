# Cannot create a temporary array or make copies of the input array
# Must move the elements in place
# Two elements may swap places
# Shouldn't be able to predict what the shuffled array looks like
# The shuffled array could look the same as the input array
# The larger the input array the higher the likelihood you will get a different array

# Modern Fisher-Yate's Shuffle Algorithm (Richard Durstenfeld's version)

class ArrayShuffle
  def shuffle(list)
    n = list.length
    (n - 1).downto(0) do |i|
      j = rand(0..i)
      list[j], list[i] = list[i], list[j]
    end
    list
  end
end
