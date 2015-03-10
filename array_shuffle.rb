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
    n.downto(1) do |i|
      i -= 1
      j = rand(0..i)
      if list[0..i].include?(j + 1)  # Not sure how this may affect arrays already shuffled
        list[j], list[i] = list[i], list[j]
      else
        next
      end
    end
    list
  end
end
