class User {
  final String id;
  final String name;
  final String email;
  final String? gender;
  final String? photoUrl;
  final String? height;
  final String? dob;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.gender,
    this.photoUrl,
    this.height,
    this.dob
  });

  User.fromJson(Map<dynamic, dynamic> json)
      : id = json['id']?.toString() ?? '',
        name = json['name']?.toString() ?? '',
        email = json['email']?.toString() ?? '',
        gender = json['gender']?.toString(),
        photoUrl = json['photoUrl']?.toString(),
        height = json['height']?.toString(),
        dob = json['dob']?.toString();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'gender': gender,
        'photoUrl': photoUrl,
        'height': height,
        'dob': dob,
      };
}