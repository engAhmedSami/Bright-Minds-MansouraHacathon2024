import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/widget/custom_check_box.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key, required this.onChange});
  final ValueChanged<bool> onChange;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isTearmAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
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
          width: 4,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: S.of(context).Remember,
                  style: AppStyles.styleMedium14(context)),
            ],
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
