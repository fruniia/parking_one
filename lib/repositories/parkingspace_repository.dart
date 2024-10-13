import 'package:parking_one/models/parking_space.dart';
import 'package:parking_one/repositories/repository.dart';

class ParkingSpaceRepository extends Repository<ParkingSpace> {
  ParkingSpaceRepository._privateConstructor();
  
  static final ParkingSpaceRepository _instance =
      ParkingSpaceRepository._privateConstructor();

  factory ParkingSpaceRepository() => _instance;
  static final List<ParkingSpace> _parkingSpaces = [];

  List<ParkingSpace> get allVehicles => _parkingSpaces;

  void updateParkingSpace(ParkingSpace parkingSpace) {
    _parkingSpaces.add(parkingSpace);
    add(parkingSpace);
  }

  void removeParkingSpace(ParkingSpace parkingSpace) {
    _parkingSpaces.remove(parkingSpace);
    delete(parkingSpace);
  }

  void updateVehicle(int index, ParkingSpace updatedParkingSpace) {
    _parkingSpaces[index].address = updatedParkingSpace.address;
    _parkingSpaces[index].pricePerHour = updatedParkingSpace.pricePerHour;
    update(index, updatedParkingSpace);
  }
}
