import 'package:dokan/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:dokan/features/login/presentation/bloc/login_bloc.dart';
import 'package:dokan/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:dokan/features/signup/presentation/pages/signup_page.dart';

import '../../features/dashboard/presentation/pages/dashboard.dart';
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
    GoRoute(
      path: DashboardPage.path,
      name: DashboardPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<DashboardBloc>(),
        child: const DashboardPage(),
      ),
    ),
  ],
);
