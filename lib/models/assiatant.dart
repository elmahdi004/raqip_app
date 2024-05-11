class Assistant {
  int id;
  String name;
  String email;
  String phoneNumber;
  // User? user;
  Assistant({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    // this.user,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) {
    return Assistant(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      // user: User(
      //   id: json['post']['user']['id'],
      //   name: json['post']['user']['name'],
      //   image: json['post']['user']['image'],
      // ),
    );
  }
}
