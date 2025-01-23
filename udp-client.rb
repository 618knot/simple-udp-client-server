# frozen_string_literal: true

require "socket"

udp_soc = UDPSocket.new

dst_host = "192.168.11.2"
dst_port = 4096

cnt = 0

src_mac = [0, 0, 0, 0, 0, 0].pack("C*")
mac_addrs = [
  "2C:CF:67:76:5A:16",
  "2C:CF:67:81:66:E3",
  "2C:CF:67:83:ED:56"
]
mac_addrs.map! { |mac| mac.split(":").map { |o| o.to_i(16) }.pack("C*") }
len = [14 + 514].pack("S>")

 

loop do
  mac_addrs.each_with_index do |mac, i|
    msg = src_mac + mac + len + ([i] * 514).pack("C*")
    udp_soc.send(msg, 0, dst_host, dst_port)
    p "##{cnt} Send: #{msg.bytes}"
  end
  sleep(5)
  cnt += 1
end