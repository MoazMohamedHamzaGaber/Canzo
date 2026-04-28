import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
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
          title: 'Full Name',
          name: 'Full Name',
          validate: '',
          type: TextInputType.name,
        ),
        CustomTextField(
          controller: phoneController,
          title: 'رقم الهاتف',
          name: 'رقم الهاتف',
          validate: '',
          type: TextInputType.phone,
        ),
        CustomTextField(
          controller: accessNumberController,
          title: 'Access Number',
          name: 'Access Number',
          validate: '',
          type: TextInputType.number,
        ),
        sizeBox(),
        buildMaterialButton(
          text: 'Sign in',
          function: () {
            navigateTo(context, BottomNavBar());
          },
          color: AppColors.green,
        ),
      ],
    );
  }
}
