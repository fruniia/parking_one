import 'package:uuid/uuid.dart';
import 'package:parking_one/models/parking_space.dart';
import 'package:parking_one/models/vehicle.dart';

class Parking {
  String id;
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  DateTime start = DateTime.now();
  DateTime? stop;

  Parking(
      {required this.id,
      required this.vehicle,
      required this.parkingSpace,
      this.stop});

  Parking.withUUID({
    required this.vehicle,
    required this.parkingSpace,
    this.stop,
  }) : id = Uuid().v4();
}
