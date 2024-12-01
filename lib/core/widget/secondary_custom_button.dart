import 'package:bright_minds/core/utils/app_colors.dart';
import 'package:bright_minds/core/utils/app_images.dart';
import 'package:bright_minds/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondaryCustomButton extends StatelessWidget {
  // Constructor with required properties for callback and text
  const SecondaryCustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: AppColors.primaryColor, width: 1.5),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.styleBoild18(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              Assets.imagesArrowRight,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
