import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AdminRegister extends StatefulWidget {
  const AdminRegister({super.key});

  @override
  State<AdminRegister> createState() => _AdminRegisterState();
}

class _AdminRegisterState extends State<AdminRegister> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var snnNumberController = TextEditingController();

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
          controller: passwordController,
          title: AppStrings.password.tr(),
          name: '**********',
          validate: '',
          obscureText: true,
          type: TextInputType.visiblePassword,
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
          text: AppStrings.createAccount.tr(),
          function: (){
            navigateAndFinish(context, BottomNavBar());
          },
          color: AppColors.green,
        ),
      ],
    );
  }
}