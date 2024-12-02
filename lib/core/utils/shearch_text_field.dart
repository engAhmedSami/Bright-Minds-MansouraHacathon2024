import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_bright_minds/core/utils/app_images.dart';
import 'package:new_bright_minds/core/utils/app_styles.dart';

class ShearchTextField extends StatelessWidget {
  const ShearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const SizedBox(
            width: 20,
            child: Center(
                child: Icon(
              Icons.search,
              color: Colors.grey,
            )),
          ),
          suffixIcon: SizedBox(
              width: 20,
              child: Center(child: SvgPicture.asset(Assets.imagesSUFF))),
          hintText: 'Search for Mentors... ',
          hintStyle: AppStyles.styleRegular17(context),
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.white,
      ),
    );
  }
}
