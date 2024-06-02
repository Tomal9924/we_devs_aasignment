part of 'user_bloc.dart';

class UserState {
  late User? user;

  UserState({
    this.user,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    return UserState(
      user: User.fromJson(map['user']),
    );
  }

  UserState copyWith({
     User? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }
}
