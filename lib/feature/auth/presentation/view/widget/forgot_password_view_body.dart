import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/core/widget/custom_botton.dart';
import 'package:new_bright_minds/core/widget/custom_text_field.dart';
import 'package:new_bright_minds/feature/auth/presentation/manager/signin_cubit/signin_cubit.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            SvgPicture.asset(Assets.imagesForgotPassword, height: 350),
            const SizedBox(height: 24),
            Text(
              'Please enter your email. We’ll send you a link to reset your password.',
              style: AppStyles.styleMedium16(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'Email',
              textInputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            const SizedBox(height: 24),
            CustomButton(
                onPressed: () {
                  context
                      .read<SigninCubit>()
                      .sendPasswordResetLink(emailController.text);
                },
                text: 'Send code')
          ],
        ),
      ),
    );
  }
}
