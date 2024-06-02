import '../../domain/entity/user.dart';

class User extends UserEntity {
  const User({
    required super.name,
    required super.email,
    required super.token,
    required super.isAuthenticated,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['user_display_name'],
      email: json['user_email'],
      token: json['token'],
      isAuthenticated: true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'isAuthenticated': isAuthenticated,
    };
  }

}
