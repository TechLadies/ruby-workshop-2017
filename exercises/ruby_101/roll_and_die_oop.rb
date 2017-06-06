class RollAndDie
  def initialize(num_dice_sides, win_num, lose_num, player)
    @num_dice_sides = num_dice_sides
    # initialize the remaining instance variables
    # that you think you will need
  end

  def roll_dice
    # complete this function
  end

  def game_end?(num)
    # replace the some_condition's with the
    # correct boolean expressions
    if some_condition
      return player.win_game
    elsif some_condition
      return player.lose_game
    end
  end

  def play
    loop do
      num = # fill this in
      puts "#{player.name} rolled #{num}"
      # finish this function
    end
  end
end
