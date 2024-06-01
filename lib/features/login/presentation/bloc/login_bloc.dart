import 'package:dokan/core/shared/shared.dart';
import 'package:dokan/features/login/domain/usecases/usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUseCase useCase;
  LoginBloc({required this.useCase}) : super(LoginInitial()) {
    on<Login>((event, emit) async {
      emit(const LoginLoading());
      final result = await useCase(
        email: event.email,
        password: event.password,
      );

      result.fold((failure) {
        emit(LoginError(message: failure));
      }, (r) {
        emit(const LoginSuccess());
      });
    });
  }
}
