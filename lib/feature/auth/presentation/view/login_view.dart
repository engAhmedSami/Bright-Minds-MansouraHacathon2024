import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bright_minds/core/services/get_it_service.dart';
import 'package:new_bright_minds/core/widget/custom_app_bar.dart';
import 'package:new_bright_minds/feature/auth/domain/repos/auth_repo.dart';
import 'package:new_bright_minds/feature/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/signin_view_body_bloc_consumer.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SigninCubit(
              getIt.get<AuthRepo>(),
            ),
        child: Scaffold(
          appBar: CustomAppBar(
            title: S.of(context).login,
          ),
          body: const LoginViewBodyBlocConsumer(),
        ));
  }
}
