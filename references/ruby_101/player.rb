class Player
  # here we use default arguments for win_msg and lose_msg
  def initialize(name, win_msg = "You win!", lose_msg = "You lose!")
    @name = name
    @win_msg = win_msg
    @lose_msg = lose_msg
    @wins = 0
    @losses = 0
  end

  def win_game
    puts @win_msg
    @wins += 1
    true
  end

  def lose_game
    puts @lose_msg
    @losses += 1
    true
  end

  def name
    @name
  end

  def wins
    @wins
  end

  def losses
    @losses
  end
end
