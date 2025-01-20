# frozen_string_literal: true

require "socket"
require "logger"

logname = "1-7-1-1_0b"
logger = Logger.new("../btrlog/#{logname}.log")
puts "Created Log: ../btrlog/#{logname}.log"
puts "UDP Server is Running...\n"
start = Time.now

Socket.udp_server_sockets("0.0.0.0", 4096) do |sockets|
  Socket.udp_server_loop_on(sockets) do |msg, _|
    m = msg.bytes
    p m
    logger.debug(m)
    if m.last == 255
      logger.debug("TIME: #{Time.now - start}")
    end
  end
end
