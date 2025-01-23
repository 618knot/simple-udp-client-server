# frozen_string_literal: true

require "socket"

udp_soc = UDPSocket.new

dst_host = "192.168.11.3"
dst_port = 4096

cnt = 0

src_mac = [0, 0, 0, 0, 0, 0].pack("C*")
dst_mac = "FF:FF:FF:FF:FF:FF".split(":").map { |o| o.to_i(16) }.pack("C*")
data = [cnt] * 514
len = [14 + data.length].pack("S>")

 

loop do
  msg = src_mac + dst_mac + len + ([cnt] * 514).pack("C*")
  udp_soc.send(msg, 0, dst_host, dst_port)
  p "##{cnt} Send: #{msg.bytes}"
  # return if cnt >= 255
  sleep(5)
  # cnt += 1
end