import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
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
        CustomTextField(
          controller: snnNumberController,
          title: 'الرقم القومي',
          name: 'الرقم القومي',
          validate: '',
          type: TextInputType.number,
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