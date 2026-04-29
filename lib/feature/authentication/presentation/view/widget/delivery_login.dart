import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/components.dart';
import 'custom_text_field.dart';

class DeliveryLogin extends StatefulWidget {
  const DeliveryLogin({super.key});

  @override
  State<DeliveryLogin> createState() => _DeliveryLoginState();
}

class _DeliveryLoginState extends State<DeliveryLogin> {
  var phoneController = TextEditingController();
  final nameController = TextEditingController();
  final accessNumberController = TextEditingController();

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
          controller: phoneController,
          title: AppStrings.phoneNumber.tr(),
          name: AppStrings.phoneNumber.tr(),
          validate: '',
          type: TextInputType.phone,
        ),
        CustomTextField(
          controller: accessNumberController,
          title: AppStrings.accessNumber.tr(),
          name: AppStrings.accessNumber.tr(),
          validate: '',
          type: TextInputType.number,
        ),
        sizeBox(),
        buildMaterialButton(
          text: AppStrings.login.tr(),
          function: () {
            navigateAndFinish(context, BottomNavBar());
          },
          color: AppColors.green,
        ),
      ],
    );
  }
}
