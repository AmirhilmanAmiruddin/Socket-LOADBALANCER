require "socket"

loadbalancer=TCPServer.open("192.168.182.133",2000)

while true
client=loadbalancer.accept

rhost = client.peeraddr.last
puts "#{rhost} connect to loadbalancer"

fromclient=client.gets
puts "message from client : #{fromclient}"

if fromclient=="boy"
sockettoserver1=TCPSocket.open("192.168.234.129",3000)
sockettoserver1.write(fromclient)
sockettoserver1.close

else if fromclient=="girl"
sockettoserver2=TCPSocket.open("192.168.234.130",4000)
sockettoserver2.write(fromclient)
sockettoserver2.close

else
puts"Error"

end
end
end

