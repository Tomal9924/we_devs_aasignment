part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends SignupEvent {
  final String name;
  final String email;
  final String password;
  const SignUp({
    required this.name,
    required this.email,
    required this.password,
  });
}
