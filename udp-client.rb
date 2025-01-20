require "socket"

udp_soc = UDPSocket.new

dst_host = "192.168.11.3"
dst_port = 4096

src_mac = "d8:3a:dd:f6:67:29".upcase.split(":").map { |o| o.to_i(16) }.pack("C*")
dst_mac = "2C:CF:67:83:EA:E4".split(":").map { |o| o.to_i(16) }.pack("C*")
# data = "0123456789!#$%&()=-~^|".chars.map(&:ord).pack("C*")
data = ([0] * 514).pack("C*")
len = [14 + data.length].pack("S>")

msg = (src_mac + dst_mac + len + data)

loop do
  udp_soc.send(msg, 0, dst_host, dst_port)
  p "Send: #{msg.bytes}"
  sleep(5)
end
