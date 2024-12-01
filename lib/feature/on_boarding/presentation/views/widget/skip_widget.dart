import 'package:bright_minds/core/utils/app_colors.dart';
import 'package:bright_minds/core/utils/app_styles.dart';
import 'package:bright_minds/generated/l10n.dart';
import 'package:flutter/material.dart';

class SkipWidget extends StatelessWidget {
  const SkipWidget(
      {super.key,
      required this.pageController,
      required this.currentPage,
      required this.onChangeLanguage});
  final PageController pageController;
  final int currentPage;
  final Function(String languageCode) onChangeLanguage;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Visibility(
        visible: currentPage == 0 ? true : false,
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.lightPrimaryColor,
            shape: BoxShape.circle,
          ),
          child: PopupMenuButton<String>(
            onSelected: (value) {
              onChangeLanguage(value);
            },
            icon: const Icon(
              Icons.language,
              color: AppColors.primaryColor,
              size: 22,
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'en', child: Text('English')),
              const PopupMenuItem(value: 'ar', child: Text('العربية')),
            ],
          ),
        ),
      ),
      Visibility(
        visible: currentPage == 0 ? false : true,
        child: GestureDetector(
          onTap: () {
            if (currentPage > 0) {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.lightPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryColor,
              size: 18,
            ),
          ),
        ),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          pageController.animateToPage(3,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        child: Opacity(
          opacity: 0.5,
          child: Text(
            S.of(context).Skip,
            textAlign: TextAlign.center,
            style: AppStyles.styleMedium20(context),
          ),
        ),
      ),
    ]);
  }
}
