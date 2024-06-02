import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/login/presentation/bloc/user/bloc/user_bloc.dart';

import 'core/shared/shared.dart';

void main() async {
  await AppConfig.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeBloc>()),
        BlocProvider(create: (_) => sl<UserBloc>()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, state) {
            final theme = state.scheme;
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1).clamp(
                  maxScaleFactor: 1.2,
                  minScaleFactor: 0.7,
                ),
              ),
              child: MaterialApp.router(
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                theme: AppConfig.theme(context: context, theme: theme),
                darkTheme: AppConfig.theme(context: context, theme: theme),
              ),
            );
          },
        );
      },
    );
  }
}
