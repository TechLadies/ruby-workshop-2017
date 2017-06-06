require 'sqlite3'
require 'sequel'

Sequel.connect("sqlite://database.db")

class Player < Sequel::Model(:players)
  def to_s
    "Name: #{name}\n" +
    "Win Message: #{win_msg}\n" +
    "Lose Message: #{lose_msg}\n" +
    "Wins: #{wins}, Losses: #{losses}\n"
  end
end
