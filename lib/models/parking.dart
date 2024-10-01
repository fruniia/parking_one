import 'package:parking_one/models/parking_space.dart';
import 'package:parking_one/models/vehicle.dart';

class Parking {
  Vehicle vehicle;
  ParkingSpace parkingSpace;
  final DateTime start = DateTime.now();
  DateTime? stop;

  Parking(this.vehicle, this.parkingSpace,  this.stop);
}
