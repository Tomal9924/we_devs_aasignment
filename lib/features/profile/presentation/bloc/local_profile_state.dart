part of 'local_profile_bloc.dart';

class ProfileLocalState {
  late ProfileModel? profileLocal;

  ProfileLocalState({
    this.profileLocal,
  });

  Map<String, dynamic> toMap() {
    return {
      'profile': profileLocal?.toMap(),
    };
  }

  factory ProfileLocalState.fromMap(Map<String, dynamic> map) {
    return ProfileLocalState(
      profileLocal: ProfileModel.fromJson(map['profile']),
    );
  }

  ProfileLocalState copyWith({
     ProfileModel? profileLocal,
  }) {
    return ProfileLocalState(
      profileLocal: profileLocal ?? this.profileLocal,
    );
  }
}
