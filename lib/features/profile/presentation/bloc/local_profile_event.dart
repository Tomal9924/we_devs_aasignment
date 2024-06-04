part of 'local_profile_bloc.dart';

sealed class LocalProfileEvent extends Equatable {
  const LocalProfileEvent();

  @override
  List<Object> get props => [];
}
class SaveLocalProfile extends LocalProfileEvent{
  final ProfileModel profileModel;
  const SaveLocalProfile({required this.profileModel});
}
