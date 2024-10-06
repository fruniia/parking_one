import 'dart:io';
import 'package:parking_one/menu.dart';
import 'package:parking_one/sub_menu.dart';

void startMenu() {
  final startMenu = Menu(
      'Welcome to the parking app \nWhat do you want to handle? (Choose: 1-5)',
      {
        1: 'Persons',
        2: 'Vehicles',
        3: 'Parkingspaces',
        4: 'Parkings',
        5: 'Quit'
      });

  bool running = true;

  while (running) {
    startMenu.display();
    int? choice = startMenu.getUserChoice();
    switch (choice) {
      case 1:
        subMenu('person');
        break;
      case 2:
        subMenu('vehicle');
        break;
      case 3:
        subMenu('parkingspace');
        break;
      case 4:
        subMenu('parking');
        break;
      case 5:
       running = quit();
      default:
        print('Please choose a valid number');
        stdout.writeln('\x1B[2J\x1B[0;0H');
        break;
    }
  }
}

bool quit() {
  print('Do you want to quit? (Y/N)');
  var input = stdin.readLineSync();
  if (input != null && input.toLowerCase() == 'y') {
    print('Thank you for using our service.');
    exit(0);
  } else {
    return true;
  }
}
