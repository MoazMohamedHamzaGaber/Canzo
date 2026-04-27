import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dropdown_button_section.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var activityNameController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = context.read<AuthCubit>();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
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
                if (cubit.state.selectedActivityType != null &&
                    cubit.state.selectedActivityType!.isNotEmpty)
                  CustomTextField(
                    controller: activityNameController,
                    title: getActivityLabel(cubit.state.selectedActivityType!),
                    name: getActivityLabel(cubit.state.selectedActivityType!),
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
            ),
          ),
        );
      },
    );
  }
}