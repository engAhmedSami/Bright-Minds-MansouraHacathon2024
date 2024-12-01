import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/widget/custom_app_bar.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/signup_view_body.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).SignUp,
        leadingIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: const SignupViewBody(),
    );
  }
}
