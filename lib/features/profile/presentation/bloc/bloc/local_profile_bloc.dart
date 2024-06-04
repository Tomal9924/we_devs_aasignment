import 'package:dokan/core/shared/shared.dart';
import 'package:dokan/features/profile/data/model/profile.dart';

part 'local_profile_event.dart';
part 'local_profile_state.dart';

class LocalProfileBloc extends Bloc<LocalProfileEvent, ProfileLocalState> with HydratedMixin {
  LocalProfileBloc()
      : super(
          ProfileLocalState(profileLocal: null),
        ) {
    on<SaveLocalProfile>(
      (event, emit) {
        emit(
          ProfileLocalState(profileLocal: event.profileModel),
        );
      },
    );
  }

  @override
  ProfileLocalState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(ProfileLocalState state) {
    throw UnimplementedError();
  }
}
