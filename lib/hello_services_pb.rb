# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: hello.proto for package 'hello'

require 'grpc'
require 'hello_pb'

module Hello
  module Hello
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'hello.Hello'

      rpc :say_hello, ::Hello::HelloRequest, ::Hello::HelloResponse
    end

    Stub = Service.rpc_stub_class
  end
end