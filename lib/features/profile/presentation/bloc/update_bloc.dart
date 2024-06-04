import 'package:dokan/core/shared/shared.dart';

import '../../domain/usecases/update.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  final UpdateProfileUseCase useCase;
  UpdateBloc({
    required this.useCase,
  }) : super(UpdateInitial()) {
    on<Update>((event, emit) async {
      emit(const UpdateLoading());
      final result=await useCase(
        firstName: event.firstName,
        lastName: event.lastName,
        id: event.id,
        token: event.token,
      );
      result.fold(
        (failure) => emit(UpdateError(failure: failure)),
        (result) => emit(const UpdateLoaded()),
      );
    });
  }
}
