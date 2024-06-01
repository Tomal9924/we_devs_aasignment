import 'package:dokan/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:dokan/features/signup/presentation/pages/signup_page.dart';

import 'shared.dart';

final router = GoRouter(
  initialLocation: SignUpPage.path,
  routes: [
    GoRoute(
      path: SignUpPage.path,
      name: SignUpPage.name,
      builder: (context, state) => BlocProvider(
        create: (context) => sl<SignupBloc>(),
        child: const SignUpPage(),
      ),
    ),
  ],
);
