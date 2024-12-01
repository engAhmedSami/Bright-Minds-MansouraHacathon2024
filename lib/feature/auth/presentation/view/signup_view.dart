import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bright_minds/core/services/get_it_service.dart';
import 'package:new_bright_minds/core/widget/custom_app_bar.dart';
import 'package:new_bright_minds/feature/auth/domain/repos/auth_repo.dart';
import 'package:new_bright_minds/feature/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/signup_view_body_block_consumer.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: S.of(context).SignUp,
          leadingIcon: Icons.arrow_back_ios_new_rounded,
        ),
        body: const SignupViewBodyBlockConsumer(),
      ),
    );
  }
}
