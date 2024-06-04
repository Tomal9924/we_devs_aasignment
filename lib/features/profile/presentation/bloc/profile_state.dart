part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
  final ProfileModel profile;
  const ProfileLoaded({required this.profile});
  @override
  List<Object> get props => [];
}

class ProfileError extends ProfileState {
  final Failure message;
  const ProfileError({required this.message});
  @override
  List<Object> get props => [];
}
