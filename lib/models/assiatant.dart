import 'package:raqip_app/models/vehicle.dart';

class Assistant {
  int id;
  String name;
  String email;
  String phoneNumber;
  Vehicle vehicle;
  // User? user;
  Assistant(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.vehicle
      // this.user,
      });

  factory Assistant.fromJson(Map<dynamic, dynamic> json) {
    return Assistant(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      vehicle: Vehicle(
          id: json['vehicle']['id'] ?? 0,
          name: json['vehicle']['name'] ?? "",
          registrationPlate: json['vehicle']['registration plate'] ?? "",
          model: json['vehicle']['model'] ?? "",
          numberOfSeats: json['vehicle']['number of seats'] ?? 0,
          status: json['vehicle']['status'] ?? "",
          positionId: json['vehicle']['position_id'] ?? 0,
          driverId: json['vehicle']['driver_id'] ?? 0),
    );
  }
}
