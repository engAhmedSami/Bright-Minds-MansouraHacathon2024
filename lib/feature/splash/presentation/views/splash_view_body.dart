import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:lottie/lottie.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/helper/shared_preferences_helper.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';
import 'package:new_bright_minds/feature/auth/presentation/view/login_view.dart';
import 'package:new_bright_minds/feature/on_boarding/presentation/views/on_boarding_view_body.dart';
import 'package:new_bright_minds/generated/l10n.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.onChangeLanguage});
  final Function(String languageCode) onChangeLanguage;

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;
  late final AnimationController _lottieController;

  @override
  void initState() {
    super.initState();

    _lottieController = AnimationController(vsync: this);

    // Controller for fading animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    // Start fading after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _fadeController.forward();
      }
    });

    // Check if onboarding has been shown before
    Future.delayed(const Duration(seconds: 4), () async {
      bool isOnboardingShown =
          await SharedPreferencesHelper.isOnboardingShown();
      if (!mounted) return;

      if (isOnboardingShown) {
        Navigator.of(context).pushReplacement(
          buildPageRoute(
            const LoginView(),
          ),
        );
      } else {
        // Show onboarding
        Navigator.of(context).pushReplacement(
          buildPageRoute(
            OnBoardingViewBody(
              onChangeLanguage: widget.onChangeLanguage,
            ),
          ),
        );

        // After showing onboarding, mark it as shown
        await SharedPreferencesHelper.setOnboardingShown();
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center the animation and reduce its size
          Expanded(
            child: Center(
              child: Lottie.asset(
                'assets/animation/Animation_two.json',
                controller: _lottieController,
                height: 500, // Adjust the height
                width: 500, // Adjust the width
                onLoaded: (composition) {
                  _lottieController
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
          ),
          buildLoadingIndicator(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).loading,
            style: AppStyles.styleMedium24(context),
          ),
          const SizedBox(width: 3),
          Transform.translate(
            offset: const Offset(0, 5),
            child: JumpingDots(
              color: AppColors.secondaryColor,
              verticalOffset: 6,
              animationDuration: const Duration(milliseconds: 200),
              radius: 6,
            ),
          ),
        ],
      ),
    );
  }
}
