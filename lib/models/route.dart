import 'dart:ffi';

class Route {
  int id;
  String name;
  Double distance;
  Double start_point_lng;
  Double start_point_lat;
  Double end_point_lng;
  Double end_point_lat;

  // User? user;
  Route({
    required this.id,
    required this.name,
    required this.distance,
    required this.start_point_lng,
    required this.start_point_lat,
    required this.end_point_lng,
    required this.end_point_lat,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      id: json['parent_id'],
      name: json['username'],
      distance: json['distance'],
      start_point_lng: json['start_point_lng'],
      start_point_lat: json['start_point_lat'],
      end_point_lng: json['end_point_lng'],
      end_point_lat: json['end_point_lat'],

      // user: User(
      //   id: json['post']['user']['id'],
      //   name: json['post']['user']['name'],
      //   image: json['post']['user']['image'],
      // ),
    );
  }
}
