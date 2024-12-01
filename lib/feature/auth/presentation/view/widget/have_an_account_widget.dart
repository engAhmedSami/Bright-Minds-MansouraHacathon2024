import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/core/widget/under_line.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).AlreadyHaveAccount,
          style: AppStyles.styleBoild14(context).copyWith(
            color: const Color(0xff949d9e),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: UnderLine(
            child: Text(
              ' ${S.of(context).SignUp}',
              style: AppStyles.styleBoild14(context).copyWith(
                color: AppColors.darkPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
