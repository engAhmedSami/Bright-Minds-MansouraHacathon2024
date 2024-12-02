import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bright_minds/core/helper/failuer_top_snak_bar.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/helper/scccess_top_snak_bar.dart';
import 'package:new_bright_minds/core/utils/custom_progrss_hud.dart';
import 'package:new_bright_minds/feature/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/login_view_body.dart';
import 'package:new_bright_minds/feature/home/userinfo.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          succesTopSnackBar(
            context,
            'Signin Successfully',
          );
          Navigator.of(context).pushReplacement(
            buildPageRoute(const UserInfo()),
          );
        }
        if (state is SigninFailure) {
          failuerTopSnackBar(
            context,
            state.message,
          );
        }
      },
      builder: (context, state) {
        return CustomProgrssHud(
          isLoading: state is SigninLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
