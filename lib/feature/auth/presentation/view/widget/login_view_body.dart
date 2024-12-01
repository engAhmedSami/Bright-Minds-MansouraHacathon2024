import 'package:flutter/material.dart';
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/core/widget/custom_botton.dart';
import 'package:new_bright_minds/core/widget/custom_name.dart';
import 'package:new_bright_minds/core/widget/custom_text_field.dart';
import 'package:new_bright_minds/core/widget/under_line.dart';
import 'package:new_bright_minds/feature/auth/controller/auth_controller.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/forgot_password_view.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/dont_have_an_account_widget.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/or_divider.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/password_field.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/remember_me.dart';
import 'package:new_bright_minds/generated/l10n.dart';

import 'social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;
  final AuthController _authController = AuthController();
  bool isRemembermeClicked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                S.of(context).Welcome,
                style: AppStyles.styleBoild18(context),
              ),
              Text(
                S.of(context).Lets,
                style: AppStyles.styleRegular16(context),
              ),
              const SizedBox(height: 32),
              CustomName(text: S.of(context).Email),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: emailController,
                hintText: S.of(context).Email,
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomName(text: S.of(context).Password),
              const SizedBox(height: 8),
              PasswordField(
                hintText: '*********',
                controller: passwordController,
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RememberMe(
                    onChange: (value) {
                      setState(() {
                        isRemembermeClicked = value;
                      });
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        buildPageRoute(
                          const ForgotPasswordView(),
                        ),
                      );
                    },
                    child: UnderLine(
                      child: Text(S.of(context).ForgetPassword,
                          style: AppStyles.styleMedium14(context)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      _authController.signInUser(
                        email: email,
                        password: password,
                        context: context,
                      );
                    }
                  },
                  text: S.of(context).login),
              const SizedBox(height: 16),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 12),
              const OrDivider(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(
                    onPressed: () {},
                    image: Assets.imagesDeviconGoogle,
                  ),
                  SocialLoginButton(
                    onPressed: () {},
                    image: Assets.imagesLogosFacebook,
                  ),
                  SocialLoginButton(
                    onPressed: () {},
                    image: Assets.imagesDeviconTwitter,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
