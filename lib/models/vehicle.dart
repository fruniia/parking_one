import 'package:parking_one/enums/vehicle_type.dart';
import 'package:parking_one/models/person.dart';

class Vehicle {
  final String id;
  final String? licensePlate;
  final Person owner;
  final VehicleType vehicleType;

  Vehicle(this.id, this.licensePlate, this.owner, this.vehicleType);
}
