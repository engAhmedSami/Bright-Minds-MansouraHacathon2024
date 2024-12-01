import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:new_bright_minds/core/helper/page_rout_builder.dart';
import 'package:new_bright_minds/core/helper/shared_preferences_helper.dart';
import 'package:new_bright_minds/core/utils/app_colors.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
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

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        _fadeController.forward();
      }
    });

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
        Navigator.of(context).pushReplacement(
          buildPageRoute(
            OnBoardingViewBody(
              onChangeLanguage: widget.onChangeLanguage,
            ),
          ),
        );

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6390cf),
              Color(0xFF2c2c68),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(Assets.imagesLogoo),

                //  SvgPicture.asset(
                //   Assets.imagesLogo,
                //   height: 300,
                //   width: 300,
                // ),
              ),
            ),
            buildLoadingIndicator(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
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
            style: AppStyles.styleMedium24(context).copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 3),
          Transform.translate(
            offset: const Offset(0, 5),
            child: JumpingDots(
              color: AppColors.orangeColor,
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
