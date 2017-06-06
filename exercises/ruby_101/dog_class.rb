class Dog
  def initialize(fur_color, weight, fur_length)
    @fur_color = fur_color
    @weight = weight
    @fur_length = fur_length
  end

  def bark
    puts "Woof, woof! I'm a dog with #{@fur_length} #{@fur_color} fur. I weigh #{@weight}kg."
  end

  def eat(amount)
    @weight += amount
  end

  # add getters for fur_color, weight, and fur_length

  # add a setter for fur_color
end

# initialize a new Dog instance

# test out the bark method

# test out the eat method

# check that your dog's weight has increased


# test out your getters

# test our your fur_color setter

# check that your dog's fur_color has been changed
