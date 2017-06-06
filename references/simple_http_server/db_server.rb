require 'socket'
require 'sqlite3'

# helper functions

def http_headers(status_code, content_type, content_length)
  "HTTP/1.1 #{status_code}\r\n" +
  "Content-Type: #{content_type}\r\n" +
  "Content-Length: #{content_length}\r\n" +
  "Connection close\r\n" +
  "\r\n"
end

def format_player(player)
  "Name: #{player.name}\n" +
  "Win Message: #{player.win_msg}\n" +
  "Lose Message: #{player.lose_msg}\n" +
  "Wins: #{player.wins}, Losses: #{player.losses}\n"
end

# Open the database
db = SQLite3::Database.new("database.db")

# create a new server socket
server = TCPServer.new('localhost', 8888)

puts "Waiting on socket localhost:8888..."

loop do
  # accept a client connection and get the associated socket
  socket = server.accept

  # Read first line of the request
  request = socket.gets

  # Print request line to terminal
  puts request

  # Extract the path from the request line
  # we split the string by a whitespace " "
  request_path = request.split(" ")[1]

  # Print path to terminal
  puts "Requested path is #{request_path}"

  # Route based on URL
  if request_path == "/"
    # Get the path to our HTML page
    path = File.join(File.dirname(__FILE__), "index.html")

    File.open(path) do |file|
      socket.print(http_headers("200 OK", "text/html", file.size))
      # Send file over socket stream
      IO.copy_stream(file, socket)
    end

  elsif request_path == "/players"
    players = db.execute("select * from players")
    response = players.to_s

    socket.print(http_headers("200 OK", "text/plain", response.bytesize))
    socket.print response
  else
    response = "404 Not Found\n"

    socket.print(http_headers("404 Not Found", "text/plain", response.bytesize))
    socket.print response
  end

   # Close the socket
  socket.close
end
