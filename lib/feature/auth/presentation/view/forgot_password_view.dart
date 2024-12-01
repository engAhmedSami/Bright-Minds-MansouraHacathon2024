import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/widget/custom_app_bar.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Forgot Password',
        leadingIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: ForgotPasswordViewBody(),
    );
  }
}
