import 'package:parking_one/models/parking.dart';
import 'package:parking_one/models/parking_space.dart';
import 'package:parking_one/models/vehicle.dart';
import 'package:parking_one/repositories/parking_repository.dart';

import 'package:parking_one/menu.dart';
import 'package:parking_one/repositories/parkingspace_repository.dart';
import 'package:parking_one/repositories/vehicle_repository.dart';
import 'package:parking_one/utils/utils.dart';

void parkingMenu(String menuType) {
  final parkingRepo = ParkingRepository();
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
        addParking(parkingRepo);
        break;
      case 2:
        showParkings(parkingRepo);
        break;
      case 3:
        updateParking(parkingRepo);
        break;
      case 4:
        deleteParking(parkingRepo);
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

List<Vehicle> getVehicles() {
  return VehicleRepository().allVehicles;
}

List<ParkingSpace> getParkingSpaces() {
  return ParkingSpaceRepository().allParkingSpaces;
}

void deleteParking(ParkingRepository parkingRepo) {}

void updateParking(ParkingRepository parkingRepo) {}

void addParking(ParkingRepository parkingRepo) {
  List<Vehicle> vehicles = getVehicles();
  List<ParkingSpace> parkingSpaces = getParkingSpaces();
  Vehicle? vehicle;
  ParkingSpace? parkingSpace;
  if (vehicles.isNotEmpty && parkingSpaces.isNotEmpty) {
    for (int i = 0; i < vehicles.length; i++) {
      print('$i ${vehicles[i].licensePlate}');
    }
    displayInfo('Please choose index of vehicle');
    var index = getNumberInput();

    if (index != null) {
      vehicle = vehicles[index];
    }
    for (int j = 0; j < parkingSpaces.length; j++) {
      print('$j ${parkingSpaces[j].address}');
    }
    displayInfo('Please choose index of parkingspace');
    var index2 = getNumberInput();
    if (index2 != null) {
      parkingSpace = parkingSpaces[index2];
    }

    if (vehicle != null && parkingSpace != null) {
      Parking p = Parking.withUUID(
        vehicle: vehicle,
        parkingSpace: parkingSpace,
      );
      parkingRepo.addParking(p);
      displaySuccess('Parking added successfully');
    } else {
      displayWarning('Vehicle or parking space selection is invalid');
    }
  } else {
    if (vehicles.isEmpty) {
      displayWarning('You need to register a vehicle before you add a parking');
    }
    if (parkingSpaces.isEmpty) {
      displayWarning(
          'You need to register a parkingspace before you add a parking');
    }
  }
}

List<Parking> showParkings(ParkingRepository parkingRepo) {
  List<Parking> parkings = parkingRepo.allParkings;
  if (parkings.isNotEmpty) {
    for (int i = 0; i < parkings.length; i++) {
      var parking = parkings[i];
      //Start shows HH:MM and Stop shows HH:MM
      print(
          'Index $i: Vehicle: ${parking.vehicle.licensePlate} ParkingSpace: ${parking.parkingSpace.address} Start: ${parking.start.hour.toString().padLeft(2, '0')}:${parking.start.minute.toString().padLeft(2, '0')} Stop:${parking.stop == null ? 'ongoing' : '${parking.stop?.hour.toString().padLeft(2, '0')}:${parking.stop?.minute.toString().padLeft(2, '0')}'}');
    }
  } else {
    print('No parkings registered');
  }
  return parkings;
}
