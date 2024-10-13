import 'package:uuid/uuid.dart';
import 'package:parking_one/enums/vehicle_type.dart';
import 'package:parking_one/models/person.dart';

class Vehicle {
  String id;
  String licensePlate;
  Person owner;
  VehicleType vehicleType;

  Vehicle(
      {required this.id,
      required this.licensePlate,
      required this.owner,
      required this.vehicleType});

  Vehicle.withUUID({
    required this.licensePlate,
    required this.owner,
    required this.vehicleType,
  }) : id = Uuid().v4();
}
