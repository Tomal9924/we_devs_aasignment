import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/login/presentation/bloc/login_bloc.dart';
import 'package:dokan/features/login/presentation/bloc/user/bloc/user_bloc.dart';

import '../../../../core/shared/enums/enum.dart';
import '../../../../core/shared/form_validator.dart';
import '../../../../core/shared/shared.dart';

class SignInPage extends StatefulWidget {
  static const path = '/signin';
  static const name = 'Sign-in';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FormValidator emailValidator = FormValidator();
  FormValidator passwordValidator = FormValidator();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    emailValidator.initialize(
        controller: _emailController, type: FormType.email);
    passwordValidator.initialize(
        controller: _passwordController, type: FormType.password);

    super.initState();
  }

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
                Image.asset("icons/logo.png",
                    fit: BoxFit.contain, width: 144, height: 144),
                const SizedBox(height: 48),
                Text(
                  "Sign in",
                  style: context
                      .textStyle17Medium(color: theme.textPrimary)
                      .copyWith(height: 1.2, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 48),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyles.body(
                          context: context,
                          color: emailValidator.isValid
                              ? theme.textPrimary
                              : theme.errorColor),
                      cursorColor: emailValidator.isValid
                          ? theme.successColor
                          : theme.errorColor,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        if (!emailValidator.isValid) {
                          setState(() {
                            emailValidator.validate();
                          });
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: theme.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16)),
                        prefixIcon: Icon(Icons.person,
                            color: emailValidator.isValid
                                ? theme.textSecondary
                                : theme.errorColor),
                        contentPadding: const EdgeInsets.all(16),
                        hintText: "email",
                        hintStyle: TextStyles.body(
                            context: context,
                            color: emailValidator.isValid
                                ? theme.textSecondary
                                : theme.errorColor.withOpacity(.25)),
                        helperText: emailValidator.validationMessage,
                        helperStyle: TextStyles.caption(
                            context: context, color: theme.errorColor),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      style: TextStyles.body(
                          context: context,
                          color: passwordValidator.isValid
                              ? theme.textPrimary
                              : theme.errorColor),
                      cursorColor: passwordValidator.isValid
                          ? theme.successColor
                          : theme.errorColor,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        setState(() {
                          passwordValidator.validate();
                        });
                      },
                      decoration: InputDecoration(
                        fillColor: theme.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(16)),
                        prefixIcon: Icon(Icons.lock_outline_rounded,
                            color: passwordValidator.isValid
                                ? theme.textSecondary
                                : theme.errorColor),
                        contentPadding: const EdgeInsets.all(16),
                        hintText: "password",
                        hintStyle: TextStyles.body(
                            context: context,
                            color: passwordValidator.isValid
                                ? theme.textSecondary
                                : theme.errorColor.withOpacity(.25)),
                        helperText: passwordValidator.validationMessage,
                        helperStyle: TextStyles.caption(
                            context: context, color: theme.errorColor),
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(
                              passwordValidator.isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: passwordValidator.isValid
                                  ? theme.textSecondary
                                  : theme.errorColor),
                          onPressed: () {
                            setState(() {
                              passwordValidator.toggleObscure();
                              passwordValidator.validationMessage = null;
                            });
                          },
                        ),
                      ),
                      obscureText: passwordValidator.isObscure,
                    ),
                  ],
                ),
                const SizedBox(height: 78),
                SizedBox(
                  width: double.infinity,
                  height: 61.h,
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        final user = state.user;
                        BlocProvider.of<UserBloc>(context).add(
                          SaveUser(user: user),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.buttonColor,
                          ),
                          child: Text('Signing in...',
                              style: context
                                  .textStyle17Medium(
                                      color: theme.backgroundColor)
                                  .copyWith(height: 1.2)),
                        );
                      } else if (state is LoginError) {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              emailValidator.validate();
                              passwordValidator.validate();
                            });
                            if (emailValidator.isValid &&
                                passwordValidator.isValid) {
                              context.read<LoginBloc>().add(
                                    Login(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
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
                      } else if (state is LoginSuccess) {
                        return const ElevatedButton(
                          onPressed: null,
                          child: Icon(Icons.done_outline_rounded),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            setState(() {
                              emailValidator.validate();
                              passwordValidator.validate();
                            });
                            if (emailValidator.isValid &&
                                passwordValidator.isValid) {
                              context.read<LoginBloc>().add(
                                    Login(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.buttonColor,
                          ),
                          child: Text('Sign In',
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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account?  ",
                        style: context
                            .textStyle17Medium(color: theme.textSecondary)
                            .copyWith(height: 1.2),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: context
                            .textStyle17Medium(color: theme.blue)
                            .copyWith(height: 1.2, fontWeight: FontWeight.bold),
                      )
                    ],
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
