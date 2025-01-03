import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obobscureText = false, // Corrected typo here
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.onSubmitted, // Added this parameter
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(String?)? onSaved;
  final bool obobscureText; // Corrected typo here
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onSubmitted; // Added this parameter

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppStyles.styleLight16(context),
      controller: controller,
      obscureText: obobscureText,
      onSaved: onSaved,
      validator: validator,
      keyboardType: textInputType,
      onFieldSubmitted: onSubmitted, // Use this for handling submissions
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.styleRegular17(context),
        filled: true,
        fillColor: Colors.transparent,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: AppColors.primaryColor,
      ),
    );
  }
}
