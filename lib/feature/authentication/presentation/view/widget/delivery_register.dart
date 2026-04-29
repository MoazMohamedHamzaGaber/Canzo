import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DeliveryRegister extends StatefulWidget {
  const DeliveryRegister({super.key});

  @override
  State<DeliveryRegister> createState() => _DeliveryRegisterState();
}

class _DeliveryRegisterState extends State<DeliveryRegister> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var accessNumberController = TextEditingController();

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
          controller: phoneController,
          title: AppStrings.accessNumber.tr(),
          name: AppStrings.accessNumber.tr(),
          validate: '',
          type: TextInputType.phone,
        ),
        sizeBox(),
        buildMaterialButton(
          text: AppStrings.createAccount.tr(),
          function: (){
            navigateTo(context, BottomNavBar());
          },
          color: AppColors.green,
        ),
      ],
    );
  }
}