require 'sequel'

# Open the database
DB = Sequel.connect("sqlite://database.db")

# Create a players table. Now we use Sequel instead of raw SQL through sqlite3
DB.create_table :players do
  primary_key :id
  String :name
  String :win_msg
  String :lose_msg
  Integer :wins
  Integer :losses
end

players = DB[:players]

# Insert player records
players.insert(name: 'Jun Qi', win_msg: '...', lose_msg: ';(', wins: 0, losses: 0)
players.insert(name: 'Kate', win_msg: 'Aha!', lose_msg: 'Adoh!', wins: 0, losses: 0)
players.insert(name: 'Elisha', win_msg: 'Cats!', lose_msg: 'Rats!', wins: 0, losses: 0)
players.insert(name: 'Wei-Liang', win_msg: 'Yessss', lose_msg: 'Noooooo', wins: 0, losses: 0)
