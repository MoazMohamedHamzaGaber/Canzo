import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(4),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.green),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(25),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.green,
        labelStyle: StyleText.style16.copyWith(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: StyleText.style16,
        dividerColor: Colors.transparent,
        tabs:  [
          Tab(text: AppStrings.login.tr()),
          Tab(text: AppStrings.createAccount.tr()),
        ],
      ),
    );
  }
}