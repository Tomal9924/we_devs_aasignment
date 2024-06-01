import 'package:bloc/bloc.dart';
import 'package:dokan/core/shared/error/failure.dart';
import 'package:dokan/features/signup/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase signUpUseCase;
  SignupBloc({required this.signUpUseCase}) : super(SignupInitial()) {
    on<SignUp>((event, emit) async {
      emit(const SignupLoading());
      final result = await signUpUseCase(
        email: event.email,
        name: event.name,
        password: event.password,
      );
      result.fold(
        (failure) => emit(SignupFailure(error: failure)),
        (user) => emit(const SignupSuccess()),
      );
    });
  }
}
