import 'package:dokan/features/login/presentation/bloc/login_bloc.dart';
import 'package:dokan/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:dokan/features/signup/presentation/pages/signup_page.dart';

import '../../features/login/presentation/pages/signin_page.dart';
import 'shared.dart';

final router = GoRouter(
  initialLocation: SignInPage.path,
  routes: [
    GoRoute(
      path: SignInPage.path,
      name: SignInPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<LoginBloc>(),
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      path: SignUpPage.path,
      name: SignUpPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<SignUpBloc>(),
        child: const SignUpPage(),
      ),
    ),
  ],
);
