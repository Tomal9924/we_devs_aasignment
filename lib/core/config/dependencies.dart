part of 'config.dart';

final sl = GetIt.instance;

Future<void> _setupDependencies() async {
  await _core;

  await Future.wait([
    _signUp,
    _login,
    _profile,
  ]);
}

Future<void> get _core async {
  sl.registerFactory(
    () => ThemeBloc(),
  );

  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(
    () => List<AddressCheckOptions>.unmodifiable(
      <AddressCheckOptions>[
        AddressCheckOptions(
          address: InternetAddress(
            '1.1.1.1', // CloudFlare
            type: InternetAddressType.IPv4,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '2606:4700:4700::1111', // CloudFlare
            type: InternetAddressType.IPv6,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '8.8.4.4', // Google
            type: InternetAddressType.IPv4,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '2001:4860:4860::8888', // Google
            type: InternetAddressType.IPv6,
          ),
        ),
        AddressCheckOptions(
          address: InternetAddress(
            '208.67.222.222', // OpenDNS
            type: InternetAddressType.IPv4,
          ), // OpenDNS
        ),
      ],
    ),
  );
}

Future<void> get _signUp async {
  sl.registerLazySingleton<SignUpRepository>(
    () => SignUpRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  sl.registerFactory(
    () => SignUpBloc(
      signUpUseCase: sl(),
    ),
  );

  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}

Future<void> get _profile async {
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  sl.registerFactory(
    () => LocalProfileBloc(),
  );
  sl.registerFactory(
    () => ProfileBloc(profileUseCase: sl()),
  );

  sl.registerLazySingleton<ProfileUseCase>(
    () => ProfileUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}

Future<void> get _login async {
  sl.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  sl.registerFactory(
    () => UserBloc(),
  );
  sl.registerFactory(
    () => LoginBloc(
      useCase: sl(),
    ),
  );

  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      repository: sl(),
    ),
  );
  sl.registerLazySingleton<SignInRemoteDataSource>(
    () => SignInRemoteDataSourceImpl(
      client: sl(),
    ),
  );
}
