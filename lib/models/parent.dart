class Parent {
  int id;
  String name;
  String contactNum;
  String email;
  String address;
  // User? user;
  Parent({
    required this.id,
    required this.name,
    required this.contactNum,
    required this.email,
    required this.address,
    // this.user,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      id: json['parent_id'],
      name: json['username'],
      contactNum: json['contact_num'],
      email: json['email'],
      address: json['address'],

      // user: User(
      //   id: json['post']['user']['id'],
      //   name: json['post']['user']['name'],
      //   image: json['post']['user']['image'],
      // ),
    );
  }
}
