import 'package:fineline_coffee/app/core/utilities/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_theme.dart';
import '../../../../core/utilities/helpers/constants.dart';
import '../../../../core/utilities/helpers/validator.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>(debugLabel: 'login');

  final Map<String, dynamic> data = {
    "email": "",
    "password": "",
  };

  // Show and hide password
  bool _obscureText = true;
  void _togglePassword() {
    setState(() => _obscureText = !_obscureText);
  }

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final formState = _key.currentState!;

    if (formState.validate()) {
      formState.save();
      BlocProvider.of<LoginCubit>(context).login(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    const text = AppTextTheme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 42,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login your account",
                style: text.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelpers.inputField(
                      "Email Address*",
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: UiHelpers.inputDecoration(),
                        autovalidateMode: Constants.validateMode,
                        onSaved: (v) => data['email'] = v,
                        validator: (v) => ValidatorHelper.email(v),
                      ),
                    ),
                    const SizedBox(height: 24),
                    UiHelpers.inputField(
                      "Password*",
                      TextFormField(
                        decoration: InputDecoration(
                          prefix: Constants.prefixSpace,
                          suffixIcon: UiHelpers.switchPassword(
                            () => _togglePassword(),
                            _obscureText,
                          ),
                        ),
                        autovalidateMode: Constants.validateMode,
                        onSaved: (v) => data['password'] = v,
                        validator: (v) => ValidatorHelper.password(v),
                        obscureText: _obscureText ? true : false,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => context.pushNamed("reset_password"),
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.right,
                          style: AppTextTheme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () => _submit(),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginError) {
                            UiHelpers.errorFlush(
                              state.message,
                              context,
                            );
                          }
                          if (state is LoginSuccessful) {
                            context.goNamed("menu");
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return UiHelpers.loader();
                          } else {
                            return const Text("SIGN IN");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    OutlinedButton(
                      onPressed: () => context.goNamed("register"),
                      child: const Text("CREATE AN ACCOUNT"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
