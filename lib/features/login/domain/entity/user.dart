import 'package:dokan/core/shared/shared.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String token;
  final bool isAuthenticated;

  const UserEntity({
    required this.name,
    required this.email,
    required this.token,
    required this.isAuthenticated,
  });

  @override
  List<Object?> get props => [name, email, token, isAuthenticated];

  @override
  String toString() {
    return 'UserEntity(name: $name, email: $email, token: $token, isAuthenticated: $isAuthenticated)';
  }

  UserEntity copyWith({
    String? name,
    String? email,
    String? token,
    bool? isAuthenticated,
  }) {
    return UserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'isAuthenticated': isAuthenticated,
    };
  }
}
