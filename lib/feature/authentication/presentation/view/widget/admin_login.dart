import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/components.dart';
import 'custom_text_field.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final snnNumberController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: nameController,
          title: AppStrings.fullName.tr(),
          name: AppStrings.fullName.tr(),
          validate: '',
          type: TextInputType.name,
        ),
        CustomTextField(
          controller: snnNumberController,
          title: AppStrings.nationalIdNumber.tr(),
          name: AppStrings.nationalIdNumber.tr(),
          validate: '',
          type: TextInputType.number,
        ),
        sizeBox(),
        buildMaterialButton(
          text: AppStrings.signIn.tr(),
          function: () {
            navigateAndFinish(context, BottomNavBar());
          },
          color: AppColors.green,
        ),
      ],
    );
  }
}
