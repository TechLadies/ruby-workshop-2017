jun_qi = Player.new("Jun Qi", "...", ";(")
kate = Player.new("Kate", "Aha!", "Adoh!")
elisha = Player.new("Elisha", "Cats!", "Rats!")
wei_liang = Player.new("Wei-liang", "Yesss", "Nooo")

players = [jun_qi, kate, elisha, wei_liang]

3.times do
  players.each do |player|
    RollAndDie.new(6, 6, 4, player).play
    puts "---------------------------"
  end
end

puts ""

players.each do |player|
  puts "#{player.name} has #{player.wins} wins and #{player.losses} losses"
end
