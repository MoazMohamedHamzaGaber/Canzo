import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
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
          controller: phoneController,
          title: 'Access Number',
          name: 'Access Number',
          validate: '',
          type: TextInputType.phone,
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