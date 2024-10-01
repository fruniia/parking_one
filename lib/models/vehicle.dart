import 'package:parking_one/enums/vehicle_type.dart';
import 'package:parking_one/models/person.dart';

class Vehicle {
  String? numberPlate;
  Person owner;
  VehicleType vehicleType;

  Vehicle(this.numberPlate, this.owner, this.vehicleType);
}
