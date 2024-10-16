import 'dart:io';

import 'package:parking_one/enums/vehicle_type.dart';
import 'package:parking_one/menu.dart';
import 'package:parking_one/models/person.dart';
import 'package:parking_one/models/vehicle.dart';
import 'package:parking_one/repositories/person_repository.dart';
import 'package:parking_one/repositories/vehicle_repository.dart';
import 'package:parking_one/utils/utils.dart';

void vehicleMenu(String menuType) {
  final vehicleRepo = VehicleRepository();

  final subMenu = Menu(
      'You have choosen to handle ${menuType.toUpperCase()}. Please choose 1-5:',
      {
        1: 'Create new $menuType',
        2: 'Show all $menuType',
        3: 'Update $menuType',
        4: 'Remove $menuType',
        5: 'Back to main menu'
      });

  bool running = true;
  while (running) {
    subMenu.display();
    int? choice = getNumberInput();
    switch (choice) {
      case 1:
        addVehicle(vehicleRepo);
        break;
      case 2:
        showVehicles(vehicleRepo);
        break;
      case 3:
        updateVehicle(vehicleRepo);
        break;
      case 4:
        deleteVehicle(vehicleRepo);
        break;
      case 5:
        clearScreen();
        return;
      default:
        clearScreen();
        displayWarning('Please choose a valid number');
        break;
    }
  }
}

void deleteVehicle(VehicleRepository vehicleRepo) {
  var vehicles = showVehicles(vehicleRepo);
  if (vehicles.isNotEmpty) {
    displayInfo('Please enter index to delete: ');
    var index = getNumberInput();

    if (index != null && index >= 0 && index < vehicles.length) {
      var vehicle = vehicles[index];
      displayWarning('Do you really want to delete?');
      var str = getTextInput();

      if (str != null && str.toLowerCase() == 'y') {
        vehicleRepo.removeVehicle(vehicle);
      }
    }
  } else {
    displayInfo('Nothing to delete');
  }
}

void updateVehicle(VehicleRepository vehicleRepo) {
  var vehicles = showVehicles(vehicleRepo);
  if (vehicles.isNotEmpty) {
    displayInfo(
        'Please choose index of Vehicle (${vehicles.length == 1 ? '0' : '0-${vehicles.length - 1}'})');
    var index = getNumberInput();

    if (index != null) {
      var vehicleToUpdate = vehicles[index];
      print(
          'What would you like to update? (1:Licenseplate 2:VehicleType 3:Owner)');
      int? choice = getNumberInput();

      if (choice == 1) {
        displayInfo('Update licenseplate');
        var newLicensePlate = setLicensePlate();

        if (newLicensePlate.isNotEmpty) {
          vehicleToUpdate.licensePlate = newLicensePlate;
        }
      } else if (choice == 2) {
        displayInfo('Update VehicleType');
        var newVehicleType = chooseVehicleType();

        if (newVehicleType != null) {
          vehicleToUpdate.vehicleType = newVehicleType;
        }
      } else if (choice == 3) {
        displayInfo('Update Owner');
        var persons = getPersons();
        Person updatedOwner;

        if (persons.isNotEmpty) {
          for (int i = 0; i < persons.length; i++) {
            print('$i ${persons[i].name}');
          }

          displayInfo('Please choose index:');
          var index = getNumberInput();

          if (index != null) {
            updatedOwner = persons[index];
            vehicleToUpdate.owner = updatedOwner;
          }
        }
      } else {
        displayWarning('Invalid choice');
      }
      showVehicles(vehicleRepo);
    }
  } else {
    print('Nothing to update');
  }
}

List<Person> getPersons() {
  return PersonRepository().allPersons;
}

void addVehicle(VehicleRepository vehicleRepo) {
  List<Person> persons = getPersons();
  Person person;

  if (persons.isNotEmpty) {
    for (int i = 0; i < persons.length; i++) {
      print('$i ${persons[i].name}');
    }

    displayInfo('Please choose index of owner:');
    var index = getNumberInput();

    if (index != null) {
      person = persons[index];
      var licensePlate = setLicensePlate();
      var vehicleType = chooseVehicleType();

      if (vehicleType != null) {
        Vehicle v = Vehicle.withUUID(
            licensePlate: licensePlate,
            owner: person,
            vehicleType: vehicleType);

        vehicleRepo.addVehicle(v);
      }
    }
  } else {
    displayWarning('You need to register before you add your vehicle.');
  }
}

VehicleType? chooseVehicleType() {
  displayInfo('Please choose a vehicletype');
  for (var type in VehicleType.values) {
    print('${type.index}: ${type.name}');
  }

  var isValid = false;
  while (!isValid) {
    displayInfo('Please enter number for the type:');
    var input = getNumberInput();

    if (input != null && input >= 0 && input < VehicleType.values.length) {
      displayInfo('Your choice: ${VehicleType.values[input].name}');
      isValid = true;
    } else {
      displayWarning('Not a valid choice, please enter a valid number');
    }

    if (isValid && input != null) {
      return VehicleType.values[input];
    }
  }
  return null;
}

List<Vehicle> showVehicles(VehicleRepository vehicleRepo) {
  List<Vehicle> vehicles = vehicleRepo.allVehicles;
  if (vehicles.isNotEmpty) {
    for (int i = 0; i < vehicles.length; i++) {
      var vehicle = vehicles[i];
      print(
          'Index $i: Type: ${vehicle.vehicleType.name} LicensePlate: ${vehicle.licensePlate} Owner: ${vehicle.owner.name}');
    }
  } else {
    print('No vehicles registered');
  }
  return vehicles;
}

String setLicensePlate() {
  bool isValid = false;
  String? licensePlate;

  while (!isValid) {
    displayInfo('Please enter licenseplate (ABC123 / ABC12A):');
    licensePlate = stdin.readLineSync();

    if (licensePlate != null && licensePlate != '') {
      validLicensePlate(licensePlate)
          ? displaySuccess('Valid licenseplate')
          : displayWarning('Invalid licenseplate');
      isValid = validLicensePlate(licensePlate);
    }
  }
  return licensePlate ?? '';
}

bool validLicensePlate(String str) {
  var regExp = RegExp(r'([A-Z,a-z]{3}[0-9]{2}[A-Z,a-z,0-9]{1})');
  return regExp.hasMatch(str);
}
