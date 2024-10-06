import 'dart:io';

import 'package:parking_one/menu.dart';

void subMenu(String menuType) {
  final subMenu = Menu(
      'Please choose what you want to do with:\n${menuType.toUpperCase()}', {
    1: 'Create new $menuType',
    2: 'Show all ${menuType}s',
    3: 'Update $menuType',
    4: 'Remove $menuType',
    5: 'Back to main menu'
  });

  bool running = true;
  while (running) {
    subMenu.display();
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');
    switch (choice) {
      case 1:
        //Create
        print('add');
        break;
      case 2:
        //Read
        print('Show');
        break;
      case 3:
        //Update
        print('update');
        break;
      case 4:
        //Delete
        print('delete');
        break;
      case 5:
        return;
      default:
        print('Please choose a valid number');
        stdout.writeln('\x1B[2J\x1B[0;0H');
        break;
    }
  }
}
