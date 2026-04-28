import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
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
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final activityNameController = TextEditingController();
  final addressController = TextEditingController();
  final snnNumberController = TextEditingController();
  final accessNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        final role = state.appRole;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNameField(),
                _buildPasswordField(role),
                _buildNationalIdField(role),
                _buildDropdown(role),
                _buildPhoneField(role),
                _buildAccessNumberField(role),
                _buildActivityField(state),
                _buildAddressField(role),
                sizeBox(),
                _buildSubmitButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  // ================= Fields =================

  Widget _buildNameField() {
    return CustomTextField(
      controller: nameController,
      title: 'Full Name',
      name: 'Full Name',
      validate: '',
      type: TextInputType.name,
    );
  }

  Widget _buildPasswordField(AppRole? role) {
    if (role == AppRole.user || role == AppRole.admin) {
      return CustomTextField(
        controller: passwordController,
        title: 'Password',
        name: '**********',
        validate: '',
        obscureText: true,
        type: TextInputType.visiblePassword,
      );
    }
    return const SizedBox();
  }

  Widget _buildNationalIdField(AppRole? role) {
    if (role == AppRole.admin) {
      return CustomTextField(
        controller: snnNumberController,
        title: 'الرقم القومي',
        name: 'الرقم القومي',
        validate: '',
        type: TextInputType.number,
      );
    }
    return const SizedBox();
  }

  Widget _buildDropdown(AppRole? role) {
    if (role == AppRole.user) {
      return Column(
        children: [
          sizeBox(height: 10),
          DropdownButtonSection(),
        ],
      );
    }
    return const SizedBox();
  }

  Widget _buildPhoneField(AppRole? role) {
    if (role == AppRole.user || role == AppRole.delivery) {
      return CustomTextField(
        controller: phoneController,
        title: 'رقم الهاتف',
        name: 'رقم الهاتف',
        validate: '',
        type: TextInputType.phone,
      );
    }
    return const SizedBox();
  }

  Widget _buildAccessNumberField(AppRole? role) {
    if (role == AppRole.delivery) {
      return CustomTextField(
        controller: accessNumberController,
        title: 'Access Number',
        name: 'Access Number',
        validate: '',
        type: TextInputType.number,
      );
    }
    return const SizedBox();
  }

  Widget _buildActivityField(AuthState state) {
    if (state.selectedActivityType != null &&
        state.selectedActivityType!.isNotEmpty) {
      return CustomTextField(
        controller: activityNameController,
        title: getActivityLabel(state.selectedActivityType!),
        name: getActivityLabel(state.selectedActivityType!),
        validate: '',
        type: TextInputType.text,
      );
    }
    return const SizedBox();
  }

  Widget _buildAddressField(AppRole? role) {
    if (role == AppRole.user) {
      return CustomTextField(
        controller: addressController,
        title: 'العنوان',
        name: 'العنوان',
        validate: '',
        type: TextInputType.text,
      );
    }
    return const SizedBox();
  }

  // ================= Button =================

  Widget _buildSubmitButton() {
    return buildMaterialButton(
      text: 'Create Account',
      function: () {},
      color: AppColors.green,
    );
  }
}