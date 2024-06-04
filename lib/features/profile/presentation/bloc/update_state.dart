part of 'update_bloc.dart';

sealed class UpdateState extends Equatable {
  const UpdateState();
  
  @override
  List<Object> get props => [];
}

final class UpdateInitial extends UpdateState {}

final class UpdateLoading extends UpdateState {

  const UpdateLoading();
}

final class UpdateLoaded extends UpdateState {
  const UpdateLoaded();
}

final class UpdateError extends UpdateState {
  final Failure failure;
  const UpdateError({
    required this.failure,
  });
}
