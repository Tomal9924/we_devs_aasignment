part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}
class Logout extends UserEvent{}
class SaveUser extends UserEvent{
  final User user;
  const SaveUser({required this.user});
}
