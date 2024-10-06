import 'package:parking_one/models/parking_space.dart';
import 'package:parking_one/models/vehicle.dart';

class Parking {
  final String id;
  final Vehicle vehicle;
  final ParkingSpace parkingSpace;
  final DateTime start = DateTime.now();
  final DateTime? stop;

  Parking(this.id, this.vehicle, this.parkingSpace, this.stop);
}
