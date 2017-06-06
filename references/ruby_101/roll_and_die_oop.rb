class RollAndDie
  def initialize(num_dice_sides, win_num, lose_num, player)
    @num_dice_sides = num_dice_sides
    @win_num = win_num
    @lose_num = lose_num
    @player = player
  end

  def roll_dice
    Random.rand(@num_dice_sides) + 1
  end

  def game_end?(num)
    if num == @win_num
      return @player.win_game
    elsif num == @lose_num
      return @player.lose_game
    end
  end

  def play
    loop do
      num = roll_dice
      puts "#{@player.name} rolled #{num}"
      break if game_end?(num)
    end
  end
end
