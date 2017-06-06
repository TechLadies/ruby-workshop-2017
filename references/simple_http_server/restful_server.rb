require 'socket'
require_relative './players.rb'

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
      # HTTP headers
      socket.print(
      "HTTP/1.1 200 OK\r\n" +
      "Content-Type: text/html\r\n" +
      "Content-Length: #{file.size}\r\n" +
      "Connection close\r\n"
      )

      # New line after headers
      # HTTP standard specifies that each line must end
      # with a carriage return (\r) and line-feed (\n)
      socket.print "\r\n"
      # Send file over socket stream
      IO.copy_stream(file, socket)
    end
  elsif request_path.include?("/players")
    # construct our response body
    response = ""
    # we required the player.rb file at the top
    # so we have access to the PLAYERS constant
    PLAYERS.each do |player|
      response +=
        "Name: #{player.name}\n" +
        "Win Message: #{player.win_msg}\n" +
        "Lose Message: #{player.lose_msg}\n" +
        "Wins: #{player.wins}, Losses: #{player.losses}\n" +
        "\n"
    end

    # HTTP headers
    # note the content type is text/plain
    # instead of text/html
    socket.print(
    "HTTP/1.1 200 OK\r\n" +
    "Content-Type: text/plain\r\n" +
    "Content-Length: #{response.bytesize}\r\n" +
    "Connection close\r\n"
    )

    # New line after headers
    # HTTP standard specifies that each line must end
    # with a carriage return (\r) and line-feed (\n)
    socket.print "\r\n"
    socket.print response
  else
    response = "404 Not Found\n"

    # HTTP headers
    # note the content type is text/plain
    # instead of text/html
    socket.print(
    "HTTP/1.1 404 Not Found\r\n" +
    "Content-Type: text/plain\r\n" +
    "Content-Length: #{response.bytesize}\r\n" +
    "Connection close\r\n"
    )

    # New line after headers
    # HTTP standard specifies that each line must end
    # with a carriage return (\r) and line-feed (\n)
    socket.print "\r\n"
    socket.print response
  end

   # Close the socket
  socket.close
end
