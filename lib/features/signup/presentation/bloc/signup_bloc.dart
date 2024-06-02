import '../../../../core/shared/shared.dart';
import '../../signup.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpUseCase signUpUseCase;
  SignUpBloc({required this.signUpUseCase}) : super(SignupInitial()) {
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
