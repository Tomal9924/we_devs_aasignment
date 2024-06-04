import 'package:dokan/core/shared/shared.dart';
import 'package:dokan/features/profile/data/model/profile.dart';
import 'package:dokan/features/profile/domain/usecases/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileBloc({
    required this.profileUseCase,
  }) : super(ProfileInitial()) {
    on<Fetch>((event, emit) async {
      emit(const ProfileLoading());
      final result=await profileUseCase(
        token: event.token,
      );
      result.fold(
        (failure) => emit(ProfileError(message: failure)),
        (profile) => emit(ProfileLoaded(profile: profile)),
      );
    });

  }
}
