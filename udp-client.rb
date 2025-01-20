# frozen_string_literal: true

require "socket"

udp_soc = UDPSocket.new

dst_host = "192.168.11.3"
dst_port = 4096

msg = [0, 1, 2, 3, 4].pack("C*")

loop do
  udp_soc.send(msg, 0, dst_host, dst_port)
  p "Send: #{msg}"
  sleep(5)
end
