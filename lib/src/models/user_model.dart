class UserModel {
  final int id;
  final bool isLoggedIn;
  final String name;
  final String email;
  final String photo;
  final String handle;
  final String token;

  UserModel({
    required this.id,
    required this.isLoggedIn,
    required this.name,
    required this.email,
    required this.photo,
    required this.handle,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      isLoggedIn: json['isLoggedIn'] ?? false,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      photo: json['photo'] ?? '',
      handle: json['handle'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  UserModel copyWith({
    int? id,
    bool? isLoggedIn,
    String? name,
    String? email,
    String? photo,
    String? handle,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      name: name ?? this.name,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      handle: handle ?? this.handle,
      token: token ?? this.token,
    );
  }
}
