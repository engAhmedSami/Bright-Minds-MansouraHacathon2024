import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/core/widget/under_line.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/signup_view.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).Donothave,
            style: AppStyles.styleBoild14(context).copyWith(
              color: const Color(0xff949d9e),
            )),
        const SizedBox(width: 5),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              buildPageRoute(
                const SignupView(),
              ),
            );
          },
          child: UnderLine(
            child: Text(
              S.of(context).Create,
              style: AppStyles.styleBoild14(context),
            ),
          ),
        ),
      ],
    );
  }
}
