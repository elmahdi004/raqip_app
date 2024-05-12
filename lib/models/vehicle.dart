class Vehicle {
  int id;
  String name;
  String registrationPlate;
  String model;
  int numberOfSeats;
  String status;
  int positionId;
  int driverId;

  // User? user;
  Vehicle({
    required this.id,
    required this.name,
    required this.registrationPlate,
    required this.model,
    required this.numberOfSeats,
    required this.status,
    required this.positionId,
    required this.driverId,

    // this.user,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['parent_id'],
      name: json['username'],
      registrationPlate: json['registration)plate'],
      model: json['model'],
      numberOfSeats: json['number_of_seats'],
      status: json['status'],
      positionId: json['position_id'],
      driverId: json['driver_id'],

      // user: User(
      //   id: json['post']['user']['id'],
      //   name: json['post']['user']['name'],
      //   image: json['post']['user']['image'],
      // ),
    );
  }
}
