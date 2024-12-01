import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';

abstract class AppStyles {
  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 16,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular17(BuildContext context) {
    return TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 14,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 16,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 18,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 20,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle styleMedium24(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 24,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle styleMedium32(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 32,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle styleBoild14(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 14,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w700,
      height: 0,
    );
  }

  static TextStyle styleBoild18(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 18,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w700,
      height: 0,
    );
  }

  static TextStyle styleLight16(BuildContext context) {
    return TextStyle(
      color: AppColors.darkPrimaryColor,
      fontSize: 16,
      fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w300,
      height: 0,
    );
  }
}
