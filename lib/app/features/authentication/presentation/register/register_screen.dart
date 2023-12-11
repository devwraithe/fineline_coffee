import 'package:fineline_coffee/app/core/utilities/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/text_theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelpers.inputField(
                      "Email Address*",
                      TextFormField(
                        decoration: UiHelpers.inputDecoration(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    UiHelpers.inputField(
                      "Password*",
                      TextFormField(
                        decoration: UiHelpers.inputDecoration(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () {},
                      child: const Text("SIGN UP"),
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
