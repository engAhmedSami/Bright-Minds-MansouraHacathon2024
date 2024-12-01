import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 24,
        ),
      ),
    ),
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppStyles.styleMedium24(context),
    ),
  );
}
