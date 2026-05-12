import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/dropdown_button_section.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/components.dart';
import 'custom_text_field.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key, required this.state,});
  final  state;
  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var activityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: phoneController,
          title: AppStrings.phoneNumber.tr(),
          name: AppStrings.phoneNumber.tr(),
          validate: '',
          type: TextInputType.phone,
        ),
        sizeBox(height: 10),
        DropdownButtonSection(),
        if (widget.state != null)
          CustomTextField(
            controller: activityNameController,
            title: getActivityLabel(widget.state!),
            name: getActivityLabel(widget.state!),
            validate: '',
            type: TextInputType.text,
          ),
        CustomTextField(
          controller: passwordController,
          title: AppStrings.password.tr(),
          name: '**********',
          validate: '',
          obscureText: true,
          type: TextInputType.visiblePassword,
        ),
        Row(
          children: [
            Spacer(),
            Text(
              AppStrings.forgetPassword.tr(),
              style: TextStyle(color: AppColors.green),
            ),
          ],
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
