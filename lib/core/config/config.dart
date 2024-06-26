import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/dashboard/data/datasources/remote.dart';
import 'package:dokan/features/dashboard/data/datasources/remote_impl.dart';
import 'package:dokan/features/dashboard/data/repositories/repo.dart';
import 'package:dokan/features/dashboard/domain/repositories/repository.dart';
import 'package:dokan/features/dashboard/domain/usecases/product.dart';
import 'package:dokan/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/login/login.dart';
import '../../features/profile/profile.dart';
import '../../features/signup/signup.dart';

part 'dependencies.dart';
part 'network_certificates.dart';

class AppConfig {
  static FutureOr<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // Bypass the SSL certificate verification
    HttpOverrides.global = MyHttpOverrides();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationCacheDirectory(),
    );

    // Initialize the configurations
    await _setupDependencies();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: sl<ThemeBloc>().state.scheme.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  static ThemeData theme({
    required BuildContext context,
    required ThemeScheme theme,
  }) =>
      ThemeData(
        brightness: Brightness.light,
        canvasColor: theme.backgroundColor,
        scaffoldBackgroundColor: theme.backgroundColor,
        splashFactory: InkRipple.splashFactory,
        inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            filled: true,
            hintStyle: context.textStyle17Regular(color: theme.textSecondary),
            fillColor: theme.backgroundColor,
            prefixIconColor: theme.textSecondary,
            labelStyle: context.textStyle17Regular(color: theme.textPrimary),
            contentPadding: const EdgeInsets.all(16.0),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: theme.errorColor),
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 1,
            padding: const EdgeInsets.all(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            elevation: 3,
            backgroundColor: Colors.white,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: theme.textPrimary),
        iconTheme: IconThemeData(color: theme.textPrimary, size: 20),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: theme.textPrimary),
          titleSpacing: 0,
          actionsIconTheme: IconThemeData(color: theme.textPrimary),
          backgroundColor: theme.backgroundSecondary,
          surfaceTintColor: theme.backgroundSecondary,
          foregroundColor: theme.backgroundColor,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: theme.backgroundColor,
          primary: theme.backgroundColor,
          brightness: Brightness.light,
        ),
      );
}
