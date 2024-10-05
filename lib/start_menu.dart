import 'package:parking_one/menu.dart';

void startMenu() {
  final startMenu = Menu<String>(
      'Welcome to the parking app \nWhat do you want to handle? (Choose: 1-5)',
      {
        1: 'Persons',
        2: 'Vehicles',
        3: 'Parkingspaces',
        4: 'Parkings',
        5: 'Quit'
      });

  final personMenu = Menu<String>('Person Menu', {
    1: 'Create new person',
    2: 'Show all persons',
    3: 'Update person',
    4: 'Remove person',
    5: 'Back to main menu'
  });

  final vehicleMenu = Menu<String>('Vehicle Menu', {
    1: 'Create new vehicle',
    2: 'Show all vehicles',
    3: 'Update vehicle',
    4: 'Remove vehicle',
    5: 'Back to main menu'
  });

  final parkingSpaceMenu = Menu<String>('Parkingspace Menu', {
    1: 'Create new parkingspace',
    2: 'Show all parkingspaces',
    3: 'Update parkingspace',
    4: 'Remove parkingspace',
    5: 'Back to main menu'
  });

  final parkingMenu = Menu<String>('Parking Menu', {
    1: 'Create new parking',
    2: 'Show all parkings',
    3: 'Update parking',
    4: 'Remove parking',
    5: 'Back to main menu'
  });

  startMenu.display();

  int? choice = startMenu.getUserChoice();

  switch (choice) {
    case 1:
      personMenu.display();
      personMenu.getUserChoice();
    case 2:
      vehicleMenu.display();
      vehicleMenu.getUserChoice();
    case 3:
      parkingSpaceMenu.display();
      parkingSpaceMenu.getUserChoice();
    case 4:
      parkingMenu.display();
      parkingMenu.getUserChoice();
    case 5:
      startMenu.display();
      startMenu.getUserChoice();
    default:
      break;
  }
}
