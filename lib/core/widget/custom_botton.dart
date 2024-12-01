import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton({required this.onPressed, super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6390cf), Color(0xFF2c2c68)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Builder(builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppStyles.styleBoild18(context)
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                Assets.imagesArrowRight,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
