import 'package:ngpack/ngpack.dart';

void main(List<String> arguments) {
  // create a ggpack file
  final key = Keys[KnownKey.Key56ad]!;
  final encoder = GGPackFileEncoder(key)
    ..addContent('hello.txt', 'hello world')
    ..addMap('hello.wimpy',
        {'hello': 'world', 'int': 42, 'double': 3.14, 'null': null})
    ..close();
  final bytes = encoder.toBytes();

  // list all the files in it
  final pack = GGPackFileDecoder(bytes, key);
  pack.forEach(print);

  // display their content
  print('hello.txt:' + pack.extractContent('hello.txt'));
  print('hello.wimpy: ' + pack.extractMap('hello.wimpy').toString());
}