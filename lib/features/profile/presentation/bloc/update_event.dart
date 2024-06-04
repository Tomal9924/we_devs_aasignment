part of 'update_bloc.dart';

abstract class UpdateEvent extends Equatable {
  const UpdateEvent();

  @override
  List<Object> get props => [];
}

class Update extends UpdateEvent {
  final String firstName;
  final String lastName;
  final String id;
  final String token;
  const Update({
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.token,
  });
}
