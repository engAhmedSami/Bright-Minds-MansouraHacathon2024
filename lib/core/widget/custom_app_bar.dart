import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Stack(
        children: [
          SvgPicture.asset(
            Assets.imagesCurve,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: preferredSize.height,
          ),
          Positioned(
            top: 50,
            left: 16,
            child: IconButton(
              icon: Icon(leadingIcon, color: Colors.white),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            ),
          ),
          SizedBox(
            height: preferredSize.height,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(title,
                  style: AppStyles.styleMedium32(context)
                      .copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(210);
}
// import 'package:bright_minds/core/utils/app_images.dart';
// import 'package:bright_minds/core/utils/app_styles.dart';
// import 'package:bright_minds/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final IconData? leadingIcon;
//   final VoidCallback? onBackPressed;
//   final bool isLoginPage;
//   final Function(String)? onChangeLanguage;

//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.onBackPressed,
//     this.leadingIcon,
//     this.isLoginPage = false,
//     this.onChangeLanguage,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: preferredSize.height,
//       child: Stack(
//         children: [
//           // الخلفية الثابتة
//           SvgPicture.asset(
//             Assets.imagesCurve,
//             fit: BoxFit.cover,
//             width: MediaQuery.of(context).size.width,
//             height: preferredSize.height,
//           ),
//           // الزر المتغير: تغيير اللغة أو الرجوع
//           Positioned(
//             top: 50,
//             left: 16,
//             child: isLoginPage
//                 ? _buildLanguageButton()
//                 : IconButton(
//                     icon: Icon(leadingIcon ?? Icons.arrow_back_ios,
//                         color: Colors.white),
//                     onPressed:
//                         onBackPressed ?? () => Navigator.of(context).pop(),
//                   ),
//           ),
//           // النص في المنتصف
//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Text(
//                 title,
//                 style: AppStyles.styleMedium32.copyWith(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   /// زر تغيير اللغة
//   Widget _buildLanguageButton() {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: const BoxDecoration(
//         color: AppColors.lightPrimaryColor,
//         shape: BoxShape.circle,
//       ),
//       child: PopupMenuButton<String>(
//         onSelected: (value) {
//           if (onChangeLanguage != null) {
//             onChangeLanguage!(value);
//           }
//         },
//         icon: const Icon(
//           Icons.language,
//           color: AppColors.primaryColor,
//           size: 22,
//         ),
//         itemBuilder: (context) => const [
//           PopupMenuItem(value: 'en', child: Text('English')),
//           PopupMenuItem(value: 'ar', child: Text('العربية')),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(210);
// }
