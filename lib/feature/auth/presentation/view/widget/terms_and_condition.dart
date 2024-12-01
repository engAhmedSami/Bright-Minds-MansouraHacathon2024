import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/core/widget/under_line.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/custom_check_box.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool isTearmAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          onChange: (value) {
            isTearmAccepted = value;
            widget.onChange(value);
            setState(() {});
          },
          isChecked: isTearmAccepted,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    S.of(context).AgreeToTerms,
                    style: AppStyles.styleBoild14(context).copyWith(
                      color: const Color(0xff949d9e),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: UnderLine(
                      child: Text(
                        S.of(context).Terms,
                        style: AppStyles.styleBoild14(context).copyWith(
                          color: AppColors.darkPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: UnderLine(
                  child: Text(
                    S.of(context).TermsAndConditions,
                    style: AppStyles.styleBoild14(context).copyWith(
                      color: AppColors.darkPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
