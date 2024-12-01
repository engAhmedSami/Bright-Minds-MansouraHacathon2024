import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/widget/custom_app_bar.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/login_view_body.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).login,
      ),
      body: const LoginViewBody(),
    );
  }
}
