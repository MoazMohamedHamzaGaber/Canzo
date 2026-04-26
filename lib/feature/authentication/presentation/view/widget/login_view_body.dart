import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/components.dart';
import 'custom_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome back!', style: StyleText.style20()),
          sizeBox(height: 10),
          Text(
            'Enter your credentials to access your account',
            style: StyleText.style16,
          ),
          sizeBox(),
          CustomTextField(
            controller: phoneController,
            title: 'رقم الهاتف',
            name: 'رقم الهاتف',
            validate: '',
            type: TextInputType.phone,
          ),
          CustomTextField(
            controller: passwordController,
            title: 'Password',
            name: '**********',
            validate: '',
            obscureText: true,
            type: TextInputType.visiblePassword,
          ),
          TextButton(onPressed: () {}, child: Text('Forget Password?',
            style: TextStyle(
              color: AppColors.green,
            ),
          )),
          sizeBox(),
          buildMaterialButton(
            text: 'Sign in',
            function: () {},
            color: AppColors.green,
          ),
        ],
      ),
    );
  }
}
