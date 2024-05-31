import '../shared.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState());

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return const ThemeState();
    }
    return ThemeState.parse(map: json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    throw UnimplementedError();
  }
}
