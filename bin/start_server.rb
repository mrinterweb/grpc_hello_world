#! /usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'grpc'
require 'hello/server'

def main
  puts "Starting server"
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:50052', :this_port_is_insecure)
  s.handle(Hello::Server)
  # Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to
  #   gracefully shutdown.
  # User could also choose to run server via call to run_till_terminated
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
end

main
