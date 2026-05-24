import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SocialLoginView extends StatelessWidget {
  const SocialLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sizeBox(),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                AppStrings.or.tr(),
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
        sizeBox(),
        buildSocialButton(
          title: AppStrings.google.tr(),
          image:
          'assets/images/google.png',
          onTap: () {},
        ),
        sizeBox(),
        buildSocialButton(
          title: AppStrings.facebook.tr(),
          image:
          'assets/images/communication.png',
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildSocialButton({
    required String title,
    required String image,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            sizeBox(),
            Image.asset(
              image,
              height: 28,
              width: 28,
            ),
          ],
        ),
      ),
    );
  }
}