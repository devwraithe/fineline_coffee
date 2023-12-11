import 'package:fineline_coffee/app/core/utilities/helpers/ui_helpers.dart';
import 'package:fineline_coffee/app/features/authentication/presentation/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_theme.dart';
import '../../../../core/utilities/helpers/constants.dart';
import '../../../../core/utilities/helpers/validator.dart';
import 'cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>(debugLabel: 'register');

  final Map<String, dynamic> data = {
    "email": "",
    "password": "",
  };

  // how and hide password
  bool _obscureText = true;
  void _togglePassword() {
    setState(() => _obscureText = !_obscureText);
  }

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final formState = _key.currentState!;

    if (formState.validate()) {
      formState.save();
      BlocProvider.of<RegisterCubit>(context).register(data);
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
                "Create an account",
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
                    FilledButton(
                      onPressed: () => _submit(),
                      child: BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state) {
                          if (state is RegisterError) {
                            UiHelpers.errorFlush(
                              state.message,
                              context,
                            );
                          }
                          if (state is RegisterSuccessful) {
                            debugPrint("Register successful");
                          }
                        },
                        builder: (context, state) {
                          if (state is RegisterLoading) {
                            return UiHelpers.loader();
                          } else {
                            return const Text("SIGN UP");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    OutlinedButton(
                      onPressed: () => context.goNamed("login"),
                      child: const Text("LOGIN YOUR ACCOUNT"),
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
