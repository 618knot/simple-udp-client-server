# frozen_string_literal: true

require "socket"
require "logger"

logname = "1-7-2-0_1b2"
logger = Logger.new("../btrlog/#{logname}.log")
puts "Created Log: ../btrlog/#{logname}.log"
puts "UDP Server is Running...\n"
start_flg = false
start = nil

Socket.udp_server_sockets("0.0.0.0", 4096) do |sockets|
  Socket.udp_server_loop_on(sockets) do |msg, _|
    m = msg.bytes

    if !start_flg && m.last == 0
      start = Time.now
      start_flg = true
    end
    
    p m
    logger.debug(m) if start_flg
    if start_flg && m.last == 255
      logger.debug("TIME: #{Time.now - start}")
      return
    end
  end
end
