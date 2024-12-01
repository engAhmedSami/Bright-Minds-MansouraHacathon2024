import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_bright_minds/core/helper/failuer_top_snak_bar.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/helper/scccess_top_snak_bar.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/widget/custom_botton.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/login_view.dart';

class VerfiedEmailViewBody extends StatefulWidget {
  const VerfiedEmailViewBody({super.key});

  @override
  VerfiedEmailViewBodyState createState() => VerfiedEmailViewBodyState();
}

class VerfiedEmailViewBodyState extends State<VerfiedEmailViewBody> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload();
        if (user.emailVerified) {
          timer.cancel();
          if (!mounted) return;
          Navigator.of(context).pushReplacement(
            buildPageRoute(const LoginView()),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Please verify your email address.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SvgPicture.asset(
                Assets.imagesConfirmed,
              ),
              const SizedBox(height: 20),
              CustomButton(
                  onPressed: () => resendVerificationEmail(context),
                  text: 'Resend Verification Email'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resendVerificationEmail(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();

      // ignore: use_build_context_synchronously
      succesTopSnackBar(context, 'Email verification link has been sent.');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Email verification link has been sent.'),
      //   ),
      // );
    } else {
      failuerTopSnackBar(context, 'Unable to send verification email.');
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Unable to send verification email.'),
      //   ),
      // );
    }
  }
}
