require 'grpc'
require_relative '../hello_services_pb'

class Hello::Server < Hello::HelloService::Service
  def say_hello(request, _unused)
    puts "say_hello called with: #{request}"
    Hello::HelloResponse.new(greeting: "Hi there, #{request.name}")
  end
end
