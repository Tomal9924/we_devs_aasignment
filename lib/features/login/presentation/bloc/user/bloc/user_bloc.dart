import 'package:dokan/core/shared/shared.dart';

import '../../../../data/model/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> with HydratedMixin {
  UserBloc()
      : super(
          UserState(
            user: null,
          ),
        ) {
    on<SaveUser>(
      (event, emit) {
        emit(
          UserState(
            user: event.user,
          ),
        );
      },
    );
    on<Logout>((event, emit) {
      emit(
        UserState(
          user: null,
        ),
      );
    });
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toMap();
  }
}
