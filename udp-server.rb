# frozen_string_literal: true

require "socket"
require "logger"

logger = Logger.new("#{Time.now.to_s.gsub(" ", "_")}.log")
puts "Created Log: #{Time.now.to_s.gsub(" ", "_")}.log"
puts "UDP Server is Running..."

Socket.udp_server_sockets("0.0.0.0", 4096) do |sockets|
  Socket.udp_server_loop_on(sockets) do |msg, _|
    logger.debug(msg)
  end
end
