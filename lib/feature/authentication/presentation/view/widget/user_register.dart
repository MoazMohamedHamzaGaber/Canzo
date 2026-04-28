import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
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
          title: 'Full Name',
          name: 'Full Name',
          validate: '',
          type: TextInputType.name,
        ),
        CustomTextField(
          controller: passwordController,
          title: 'Password',
          name: '**********',
          validate: '',
          obscureText: true,
          type: TextInputType.visiblePassword,
        ),
        sizeBox(height: 10),
        DropdownButtonSection(),
        CustomTextField(
          controller: phoneController,
          title: 'رقم الهاتف',
          name: 'رقم الهاتف',
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
          title: 'العنوان',
          name: 'العنوان',
          validate: '',
          type: TextInputType.text,
        ),
        sizeBox(),
        buildMaterialButton(
          text: 'Create Account',
          function: (){},
          color: AppColors.green,
        ),
      ],
    );
  }
}