import 'package:dokan/core/shared/extensions/theme.dart';

import '../../../../core/shared/shared.dart';
import '../../signup.dart';

class SignUpPage extends StatefulWidget {
  static const path = '/signup';
  static const name = 'Sign-up';

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Scaffold(
          backgroundColor: theme.backgroundColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ProfilePhoto(),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Input(
                        controller: _nameController,
                        icon: Icons.person_outline_rounded,
                        type: TextInputType.name,
                        onChanged: (value) {
                          return value;
                        },
                        validator: (name) {
                          if (name == null) {
                            return "Invalid name";
                          }
                          return name.isEmpty ? " *Required" : null;
                        },
                        hint: 'Name',
                      ),
                      const SizedBox(height: 20),
                      Input(
                        controller: _emailController,
                        icon: Icons.email_outlined,
                        type: TextInputType.emailAddress,
                        onChanged: (value) {
                          return value;
                        },
                        validator: (email) {
                          if (email == null) {
                            return "Invalid email";
                          }
                          return email.isEmpty ? " *Required" : null;
                        },
                        hint: 'Email',
                      ),
                      const SizedBox(height: 20),
                      Input(
                        controller: _passwordController,
                        icon: Icons.lock_outline_rounded,
                        type: TextInputType.visiblePassword,
                        onChanged: (value) {
                          return value;
                        },
                        validator: (password) {
                          if (password == null) {
                            return "Invalid password";
                          }
                          return password.isEmpty ? " *Required" : null;
                        },
                        hint: 'Password',
                      ),
                      const SizedBox(height: 20),
                      Input(
                        controller: _confirmPasswordController,
                        icon: Icons.lock_outline_rounded,
                        type: TextInputType.visiblePassword,
                        onChanged: (value) {
                          return value;
                        },
                        validator: (confirmPassword) {
                          if (confirmPassword == null) {
                            return "Invalid password";
                          }
                          return confirmPassword.isEmpty ? " *Required" : null;
                        },
                        hint: 'Confirm Password',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 78),
                SizedBox(
                  width: double.infinity,
                  height: 61.h,
                  child: BlocBuilder<SignUpBloc, SignupState>(
                    builder: (context, state) {
                      if (state is SignupLoading) {
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.buttonColor,
                          ),
                          child: Text('Signing up...',
                              style: context
                                  .textStyle17Medium(
                                      color: theme.backgroundColor)
                                  .copyWith(height: 1.2)),
                        );
                      } else if (state is SignupFailure) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<SignUpBloc>().add(
                                  SignUp(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.buttonColor,
                          ),
                          child: Text('Try again!',
                              style: context
                                  .textStyle17Medium(
                                      color: theme.backgroundColor)
                                  .copyWith(height: 1.2)),
                        );
                      } else if (state is SignupSuccess) {
                        return const ElevatedButton(
                          onPressed: null,
                          child: Icon(Icons.done_outline_rounded),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_formKey.currentState!.validate()) {
                              context.read<SignUpBloc>().add(
                                    SignUp(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.buttonColor,
                          ),
                          child: Text('Sign Up',
                              style: context
                                  .textStyle17Medium(
                                      color: theme.backgroundColor)
                                  .copyWith(height: 1.2)),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PhysicalModel(
                      color: theme.white,
                      borderRadius: BorderRadius.circular(context.radius10),
                      elevation: 1,
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Image.asset(
                          'icons/facebook.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    PhysicalModel(
                      color: theme.white,
                      borderRadius: BorderRadius.circular(context.radius10),
                      elevation: 1,
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Image.asset(
                          'icons/google.png',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 52),
                InkWell(
                  onTap: () {
                    context.go(SignInPage.path);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?   ',
                          style: context
                              .textStyle14Medium(color: theme.textSecondary)
                              .copyWith(height: 1.2),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: context
                              .textStyle14Medium(color: theme.blue)
                              .copyWith(
                                  height: 1.2, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
