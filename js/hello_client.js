const PROTO_PATH = __dirname + '/../proto/hello.proto'

const grpc = require('@grpc/grpc-js')
const protoLoader = require('@grpc/proto-loader')
const packageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {keepCase: true,
     longs: String,
     enums: String,
     defaults: true,
     oneofs: true
    })
const hello_proto = grpc.loadPackageDefinition(packageDefinition).hello

const client = new hello_proto.HelloService('localhost:50052', grpc.credentials.createInsecure())

const argv = process.argv.slice(2)
const name = (argv.length > 0) ? argv[0] : 'world'

client.sayHello({name: name}, function(_err, response) {
  console.log('Greeting:', response.greeting)
})
