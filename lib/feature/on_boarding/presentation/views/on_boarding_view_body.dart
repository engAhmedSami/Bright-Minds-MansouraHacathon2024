import 'package:flutter/material.dart';
import 'package:new_bright_minds/constants.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/widget/circular_arrow_button.dart';
import 'package:new_bright_minds/core/widget/custom_botton.dart';
import 'package:new_bright_minds/core/widget/secondary_custom_button.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/login_view.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/signup_view.dart';
import 'package:new_bright_minds/feature/on_boarding/presentation/views/widget/on_boarding_page_view.dart';
import 'package:new_bright_minds/feature/on_boarding/presentation/views/widget/skip_widget.dart';
import 'package:new_bright_minds/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingViewBody extends StatefulWidget {
  final Function(String languageCode) onChangeLanguage;

  const OnBoardingViewBody({super.key, required this.onChangeLanguage});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
          child: Column(
            children: [
              const SizedBox(height: 25),
              SkipWidget(
                onChangeLanguage: widget.onChangeLanguage,
                currentPage: currentPage,
                pageController: pageController,
              ),
              Expanded(
                child: OnBoardingPageView(
                  pageController: pageController,
                ),
              ),
              IndexedStack(
                alignment: Alignment.center,
                index: currentPage == 3
                    ? 1
                    : 0, // عرض الزر المناسب بناءً على الصفحة
                children: [
                  CircularArrowButton(
                    onPressed: () {
                      if (currentPage > -1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        buildPageRoute(
                          const SignupView(),
                        ),
                      );
                    },
                    text: S.of(context).SignUp,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              IndexedStack(
                alignment: Alignment.center,
                index: currentPage == 3 ? 0 : 1,
                children: [
                  SecondaryCustomButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        buildPageRoute(
                          const LoginView(),
                        ),
                      );
                    },
                    text: S.of(context).login,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
