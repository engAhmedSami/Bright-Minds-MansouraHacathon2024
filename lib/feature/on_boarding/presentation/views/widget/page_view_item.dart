import 'package:bright_minds/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.subtitle,
    required this.image,
    required this.tital,
  });

  final String image;
  final String tital;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(image),
              ),
            ),
            const SizedBox(height: 18),
            Column(
              children: [
                Text(
                  tital,
                  style: AppStyles.styleMedium16(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  subtitle,
                  style: AppStyles.styleLight16(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
