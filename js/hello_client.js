var PROTO_PATH = __dirname + '/../proto/hello.proto';

var parseArgs = require('minimist');
var grpc = require('@grpc/grpc-js');
var protoLoader = require('@grpc/proto-loader');
var packageDefinition = protoLoader.loadSync(
    PROTO_PATH,
    {keepCase: true,
     longs: String,
     enums: String,
     defaults: true,
     oneofs: true
    });
var hello_proto = grpc.loadPackageDefinition(packageDefinition).hello;

function main() {
  var argv = parseArgs(process.argv.slice(2), {
    string: 'target'
  });
  var target;
  if (argv.target) {
    target = argv.target;
  } else {
    target = 'localhost:50052';
  }
  var client = new hello_proto.HelloService(target,
                                       grpc.credentials.createInsecure());
  var name;
  if (argv._.length > 0) {
    name = argv._[0];
  } else {
    name = 'world';
  }
  client.sayHello({name: name}, function(err, response) {
    console.log('Greeting:', response.greeting);
  });
}

main();
