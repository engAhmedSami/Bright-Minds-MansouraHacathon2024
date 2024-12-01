import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';

class CustomName extends StatelessWidget {
  const CustomName({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: AppStyles.styleRegular16(context).copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
