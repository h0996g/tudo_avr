class ProfileM {
  final String? name;
  final String? email;
  final int? age;
  ProfileM({this.name, this.email, this.age});

  factory ProfileM.fromJson(Map<String, dynamic> json) {
    return ProfileM(name: json['name'], email: json['email'], age: json['age']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'age': age};
  }
}
