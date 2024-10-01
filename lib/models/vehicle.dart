import 'package:parking_one/enums/vehicle_type.dart';
import 'package:parking_one/models/person.dart';

class Vehicle {
  String? licensePlate;
  Person owner;
  VehicleType vehicleType;

  Vehicle(this.licensePlate, this.owner, this.vehicleType);
}
