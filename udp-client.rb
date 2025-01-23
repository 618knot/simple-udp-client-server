# frozen_string_literal: true

require "socket"

udp_soc = UDPSocket.new

dst_host = "192.168.11.3"
dst_port = 4096

cnt = 0

src_mac = [0, 0, 0, 0, 0, 0].pack("C*")
dst_mac = "2C:CF:67:83:EA:E4".split(":").map { |o| o.to_i(16) }.pack("C*")
data = [5] * 514
len = [14 + data.length].pack("S>")

msg = src_mac + dst_mac + len + data.pack("C*")

loop do
  udp_soc.send(msg, 0, dst_host, dst_port)
  p "##{cnt} Send: #{msg.bytes}"
  sleep(0.001)
  cnt += 1
end
