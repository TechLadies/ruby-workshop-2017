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

  def fur_color
    @fur_color
  end

  def weight
    @weight
  end

  def fur_length
    @fur_length
  end
end

doge = Dog.new("orange", 8, "short")

# doge will tell us about himself
doge.bark

# doge will eat foodz
doge.eat(1)

# doge will show us how he gained weight
doge.bark

# create another Dog instance
chihuahua = Dog.new("white", 2, "long")

# all instances of Dog have the same methods!
chihuahua.bark
chihuahua.eat(0.2)
chihuahua.bark

# test out getters
puts doge.fur_color
puts doge.fur_length
puts doge.weight
