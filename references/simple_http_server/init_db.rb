require 'sqlite3'

# Open the database
db = SQLite3::Database.new("database.db")

# Create a players table
db.execute <<~SQL
  create table players (
    id int primary key,
    name varchar(50),
    win_msg varchar(100),
    lose_msg varchar(100),
    wins int,
    losses int
  )
SQL

# Insert player records
db.execute(
  "INSERT INTO players (id, name, win_msg, lose_msg, wins, losses)
  VALUES (?, ?, ?, ?, ?, ?)", [1, "Jun Qi", "...", ";(", 0, 0]
)

db.execute(
  "INSERT INTO players (id, name, win_msg, lose_msg, wins, losses)
  VALUES (?, ?, ?, ?, ?, ?)", [2, "Kate", "Aha!", "Adoh!", 0, 0]
)

db.execute(
  "INSERT INTO players (id, name, win_msg, lose_msg, wins, losses)
  VALUES (?, ?, ?, ?, ?, ?)", [3, "Elisha", "Cats!", "Rats!", 0, 0]
)

db.execute(
  "INSERT INTO players (id, name, win_msg, lose_msg, wins, losses)
  VALUES (?, ?, ?, ?, ?, ?)", [4, "Wei-liang", "Yesss", "Nooo", 0, 0]
)
