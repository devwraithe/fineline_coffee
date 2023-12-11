import 'package:fineline_coffee/app/core/utilities/helpers/ui_helpers.dart';
import 'package:fineline_coffee/app/features/authentication/presentation/reset_password/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_theme.dart';
import '../../../../core/utilities/helpers/constants.dart';
import '../../../../core/utilities/helpers/validator.dart';
import 'cubit/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _key = GlobalKey<FormState>(debugLabel: 'reset-password');

  TextEditingController email = TextEditingController();

  void _submit() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final formState = _key.currentState!;

    if (formState.validate()) {
      formState.save();
      BlocProvider.of<ResetPasswordCubit>(context).resetPassword(email.text);
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
                "Forgot password",
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
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: UiHelpers.inputDecoration(),
                        autovalidateMode: Constants.validateMode,
                        onSaved: (v) => email.text = v!,
                        validator: (v) => ValidatorHelper.email(v),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () => _submit(),
                      child:
                          BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                        listener: (context, state) {
                          if (state is ResetPasswordError) {
                            UiHelpers.errorFlush(
                              state.message,
                              context,
                            );
                          }
                          if (state is ResetPasswordSuccessful) {
                            debugPrint("ResetPassword successful");
                          }
                        },
                        builder: (context, state) {
                          if (state is ResetPasswordLoading) {
                            return UiHelpers.loader();
                          } else {
                            return const Text("SEND LINK");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 14),
                    OutlinedButton(
                      onPressed: () => context.goNamed("login"),
                      child: const Text("BACK TO LOGIN"),
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
