part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}
class Fetch extends ProfileEvent {
  final String token;
  const Fetch({required this.token});
}
