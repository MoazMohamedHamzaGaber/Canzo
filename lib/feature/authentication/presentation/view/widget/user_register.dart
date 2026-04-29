import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dropdown_button_section.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key, this.state});
  final state;

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var activityNameController = TextEditingController();
  var addressController = TextEditingController();

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
          name: '***********',
          validate: '',
          obscureText: true,
          type: TextInputType.visiblePassword,
        ),
        sizeBox(height: 10),
        DropdownButtonSection(),
        CustomTextField(
          controller: phoneController,
          title: AppStrings.phoneNumber.tr(),
          name: AppStrings.phoneNumber.tr(),
          validate: '',
          type: TextInputType.phone,
        ),
        if (widget.state != null &&
            widget.state!.isNotEmpty)
          CustomTextField(
            controller: activityNameController,
            title: getActivityLabel(widget.state!),
            name: getActivityLabel(widget.state!),
            validate: '',
            type: TextInputType.text,
          ),
        CustomTextField(
          controller: addressController,
          title: AppStrings.address.tr(),
          name: AppStrings.address.tr(),
          validate: '',
          type: TextInputType.text,
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