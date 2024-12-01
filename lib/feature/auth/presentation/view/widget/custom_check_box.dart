import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChange});
  final bool isChecked;
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : const Color(0xffdcdede),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? const Padding(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ))
            : const SizedBox(),
      ),
    );
  }
}
