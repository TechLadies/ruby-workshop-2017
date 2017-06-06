require 'socket'

# create a new server socket
server = TCPServer.new('localhost', 8888)

puts "Waiting on socket localhost:8888..."

loop do
  # accept a client connection and get the associated socket
  socket = server.accept

  # Read first line of the request
  request = socket.gets

  # Print request to terminal
  puts request

  response = "Hello World!\n"

  # HTTP headers
  socket.print(
  "HTTP/1.1 200 OK\r\n" +
  "Content-Type: text/html\r\n" +
  "Content-Length: #{response.bytesize}\r\n" +
  "Connection close\r\n"
  )

  # New line after headers
  # HTTP standard specifies that each line must end
  # with a carriage return (\r) and line-feed (\n)
  socket.print "\r\n"
  # Send response body
  socket.print response

  # Close the socket
  socket.close
end
