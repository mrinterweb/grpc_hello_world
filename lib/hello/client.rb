require 'grpc'
require 'hello_services_pb'
require 'singleton'

class Hello::Client
  include Singleton

  attr_reader :client

  def initialize
    @client = Hello::HelloService::Stub.new('0.0.0.0:50052', :this_channel_is_insecure)
  end

  def say_hello(name)
    request = request(name)
    client.say_hello(request)
  end

  private

  def request(name)
    Hello::HelloRequest.new(name: name)
  end
end
