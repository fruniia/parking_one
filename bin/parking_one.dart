import 'dart:io';
import 'package:parking_one/parking_one.dart' as parking_one;

void main(List<String> arguments) {
  int? input1, input2 = 0;

  print('Type in a number ');
  var line = stdin.readLineSync();
  if (line != null) {
    input1 = int.tryParse(line);
  }

  print('First number: $input1');
  print('Type in another number ');
  line = stdin.readLineSync();
  if (line != null) {
    input2 = int.tryParse(line);
  }
  print('Second number $input2');

  print('Total: ${parking_one.calculate(input1, input2)}!');
}
