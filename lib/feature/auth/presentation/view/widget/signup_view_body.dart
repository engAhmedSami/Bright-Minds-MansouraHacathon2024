import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/helper/failuer_top_snak_bar.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/core/widget/custom_botton.dart';
import 'package:new_bright_minds/core/widget/custom_name.dart';
import 'package:new_bright_minds/core/widget/custom_text_field.dart';
import 'package:new_bright_minds/feature/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/have_an_account_widget.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/password_field.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/terms_and_condition.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, name, password, confirmPassword;
  late bool isTermsAccepted = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                S.of(context).Createyouraccount,
                style: AppStyles.styleBoild18(context),
              ),
              Text(
                S.of(context).Register,
                style: AppStyles.styleRegular16(context),
              ),
              const SizedBox(height: 32),
              CustomName(text: S.of(context).FullName),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: nameController,
                onSaved: (value) {
                  name = value!;
                },
                hintText: S.of(context).FullName,
                textInputType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomName(text: S.of(context).Email),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: emailController,
                onSaved: (value) {
                  email = value!;
                },
                hintText: S.of(context).Email,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                  if (!emailRegExp.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
                    return 'Password must contain at least one digit';
                  }
                  if (!RegExp(r'(?=.*?[!@#$%^&*(),.?":{}|<>])')
                      .hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomName(text: S.of(context).ConfirmPassword),
              const SizedBox(height: 8),
              PasswordField(
                hintText: '*********',
                controller: confirmPasswordController,
                onSaved: (value) {
                  confirmPassword = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TermsAndCondition(
                onChange: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (!isTermsAccepted) {
                        failuerTopSnackBar(
                            context, 'Please accept terms and conditions');
                      } else {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              email,
                              password,
                              name,
                            );
                      }
                    }
                  },
                  text: S.of(context).SignUp),
              const SizedBox(height: 16),
              const HaveAnAccountWidget(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
