def roll_die(n)
  Random.rand(n) + 1
end

# note: the if..elsif..end statement evalutes to `nil`
# so we don't win or lose, the function will return `nil`
# `nil` acts like `false` in conditional expressions
# it is a so-called "falsey" value
# that is why we can omit the `return false` from the last line
def game_end(num, win_num, lose_num)
  if num == win_num
    puts "You win!"
    return true
  elsif num == lose_num
    puts "You lose!"
    return true
  end
end

def roll_and_die(n, win_num, lose_num, name)
  loop do
    num = roll_die(n)
    puts "#{name} rolled #{num}"
    break if game_end(num, win_num, lose_num)
  end
end

players = ["Jun Qi", "Kate", "Elisha", "Wei-liang", "Michael", "Daniel", "Tong Wei"]

players.each do |player|
  roll_and_die(6, 6, 4, player)
  roll_and_die(20, 15, 9, player)
  roll_and_die(30, 21, 17, player)
end
