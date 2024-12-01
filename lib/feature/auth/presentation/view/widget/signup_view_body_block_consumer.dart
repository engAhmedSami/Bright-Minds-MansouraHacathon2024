import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_bright_minds/core/helper/failuer_top_snak_bar.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/helper/scccess_top_snak_bar.dart';
import 'package:new_bright_minds/feature/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/signup_view_body.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/verfied_email_view_body.dart';

class SignupViewBodyBlockConsumer extends StatelessWidget {
  const SignupViewBodyBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          succesTopSnackBar(
            context,
            'Account created successfully, verify your account  ',
          );
          Navigator.of(context).pushReplacement(
            buildPageRoute(const VerfiedEmailViewBody()),
          );
        }

        if (state is SignupFailure) {
          failuerTopSnackBar(
            context,
            state.message,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoding ? true : false,
          child: const SignupViewBody(),
        );
      },
    );
  }
}
