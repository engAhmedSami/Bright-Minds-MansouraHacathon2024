import 'package:flutter/material.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/feature/on_boarding/presentation/views/widget/page_view_item.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: Assets.imagesOnBordingOne,
          tital: S.of(context).title1,
          subtitle: S.of(context).subtitle1,
        ),
        PageViewItem(
          image: Assets.imagesOnBordingTwo,
          tital: S.of(context).title2,
          subtitle: S.of(context).subtitle2,
        ),
        PageViewItem(
          image: Assets.imagesOnBordingThree,
          tital: S.of(context).title3,
          subtitle: S.of(context).subtitle3,
        ),
        PageViewItem(
          image: Assets.imagesOnBordingFour,
          tital: S.of(context).title4,
          subtitle: S.of(context).subtitle4,
        ),
      ],
    );
  }
}
