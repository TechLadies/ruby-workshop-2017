require 'socket'

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

  # Close the socket
  socket.close
end
