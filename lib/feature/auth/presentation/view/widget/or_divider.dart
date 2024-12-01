import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.primaryColor,
            indent: 55,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(S.of(context).continuewith,
            style: AppStyles.styleMedium14(context).copyWith(
              color: AppColors.darkPrimaryColor,
            )),
        const SizedBox(
          width: 8,
        ),
        const Expanded(
          child: Divider(
            color: AppColors.primaryColor,
            endIndent: 55,
          ),
        ),
      ],
    );
  }
}
