def roll_die(n)
  Random.rand(n) + 1
end

def game_end(num, win_num, lose_num, msgs)
  if num == win_num
    puts msgs[:win]
    return true
  elsif num == lose_num
    puts msgs[:lose]
    return true
  end
end

def roll_and_die(n, win_num, lose_num, name, msgs)
  loop do
    num = roll_die(n)
    puts "#{name} rolled #{num}"
    break if game_end(num, win_num, lose_num, msgs)
  end
end

players = {
  "Jun Qi" => {win: "...", lose: ";("},
  "Kate" => {win: "Aha!!!", lose: "Adoh!"},
  "Elisha" => {win: "Cats!", lose: "Rats!"},
  "Wei-liang" => {win: "Yesss", lose: "Nooo"},
}


players.each do |(name, msgs)|
  roll_and_die(6, 6, 4, name, msgs)
  puts ""
end
