part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {
  const SignupLoading();
}

class SignupSuccess extends SignupState {
  const SignupSuccess();
}

class SignupFailure extends SignupState {
  final Failure error;
  const SignupFailure({required this.error});
}
