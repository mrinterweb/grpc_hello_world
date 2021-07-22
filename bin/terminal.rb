#! /usr/bin/env ruby

require "bundler/setup"

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'pry'
require 'hello/client'

def client
  @client || Hello::Client.instance
end

# response = client.say_hello('fred')
# puts "Client received: #{response}"

binding.pry
