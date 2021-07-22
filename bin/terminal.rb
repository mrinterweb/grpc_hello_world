#! /usr/bin/env ruby

require "bundler/setup"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'pry'
require 'hello/client'

def client
  @client || Hello::Client.instance
end

name = ARGV[0] || 'Sean'
response = client.say_hello(name)
puts "Client received: #{response}"

# binding.pry
