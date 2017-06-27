require 'socket'
require 'sqlite3'
require 'sequel'
require_relative './player_model.rb'

# helper functions

def http_headers(status_code, content_type, content_length)
  "HTTP/1.1 #{status_code}\r\n" +
  "Content-Type: #{content_type}\r\n" +
  "Content-Length: #{content_length}\r\n" +
  "Connection close\r\n" +
  "\r\n"
end

# Open the database
db = Sequel.connect("sqlite://database.db")

# create a new server socket
server = TCPServer.new('localhost', 8888)

puts "Waiting on socket localhost:8888..."

loop do
  # accept a client connection and get the associated socket
  socket = server.accept

  # Get HTTP request-line
  request = socket.gets
  puts request

  # Read in HTTP headers
  # we could probably extract this into a function of its own...
  while header = socket.gets do
    # read up on what `inspect` does
    puts header.inspect

    # We need to extract the Content-Length value
    # to know how many bytes to read in for the request body
    # `strip` removes leading and trailing whitespace characters,
    # including the "\r\n" characters
    # `split` splits the string by the given separator
    name, value = header.strip.split(': ')
    # we must convert the string value to an integer with `to_i`
    # so that we can pass it to the `read` method later
    content_length = value.to_i if name == 'Content-Length'

    # break once we've read in all the headers
    # the end of the header is demarcated by "\r\n"
    break if header == "\r\n"
  end

  # Get and parse the body of our HTTP request
  # we should only `read` if content_length was assigned
  # otherwise the `read` operation will block until the socket
  # is closed
  # we could probably extract this into a method of its own...
  if content_length
    body = socket.read(content_length)
    puts body.inspect

    # puts fields into a hash
    parsed_body = {}
    body.split('&').each do |field|
      name, value = field.split('=')
      parsed_body[name] = value
    end
    puts parsed_body
  end

  # Extract the method and path from the request line
  # we split the string by a whitespace " "
  request_method, request_path = request.split(" ")

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

    if request_method == "POST"
      # you can find this method in Sequel docs
      player = Player.create(parsed_body)

      # let's return the newly created player in our server response
      response = player.to_s
      socket.print(http_headers("200 OK", "text/plain", response.bytesize))
      socket.print response
    elsif request_method == "GET"
      players = Player.all
      response = players.map(&:to_s).join("\n")

      socket.print(http_headers("200 OK", "text/plain", response.bytesize))
      socket.print response
    end
  else
    response = "404 Not Found\n"

    socket.print(http_headers("404 Not Found", "text/plain", response.bytesize))
    socket.print response
  end

   # Close the socket
  socket.close
end
