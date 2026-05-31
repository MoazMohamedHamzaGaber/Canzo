import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/update_profile_use_case.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../authentication/domain/entity/activity_type.dart';
import '../../../../authentication/presentation/cubit/auth_cubit.dart';
import '../../../../authentication/presentation/view/widget/dropdown_button_section.dart';
import '../../../domain/entity/profile_entity.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, required this.profile});

  final ProfileEntity profile;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController activityNameController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.profile.userName);

    emailController = TextEditingController(text: widget.profile.email);

    phoneController = TextEditingController(text: widget.profile.phone);

    addressController = TextEditingController(text: widget.profile.address);

    activityNameController = TextEditingController(
      text: widget.profile.activityName,
    );

    context.read<AuthCubit>().changeSelectedActivity(
      context.read<AuthCubit>().getActivityTypeFromString(
        widget.profile.activityType,
      ) ??
          ActivityType.restaurant,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    activityNameController.dispose();

    super.dispose();
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${AppStrings.pleaseEnter.tr()} $title';
          }

          return null;
        },
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(AppStrings.updateProfile.tr())),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStates.updateSuccess) {
            showSnackBar(
              context: context,
              message: AppStrings.profileUpdatedSuccessfully.tr(),
            );

            //Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = context.read<ProfileCubit>();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildTextField(
                    title: AppStrings.userName.tr(),
                    controller: nameController,
                  ),
                  sizeBox(),
                  buildTextField(
                    title: AppStrings.email.tr(),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  sizeBox(),
                  buildTextField(
                    title: AppStrings.phoneNumber.tr(),
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  sizeBox(),
                  buildTextField(
                    title: AppStrings.address.tr(),
                    controller: addressController,
                  ),
                  sizeBox(height: 12),
                  const DropdownButtonSection(),
                  sizeBox(),

                  buildTextField(
                    title: AppStrings.activityName.tr(),
                    controller: activityNameController,
                  ),

                  const SizedBox(height: 20),

                  buildMaterialButton(
                    text: AppStrings.update.tr(),
                    loading: state.status == ProfileStates.loading
                        ? true
                        : false,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(widget.profile.activityType);
                        cubit.updateProfile(
                          context,
                          UpdateProfileParams(
                            username: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            address: addressController.text,
                            activityType: context
                                .read<AuthCubit>()
                                .state
                                .selectedActivityType
                                ?.apiValue ??
                                '',
                            activityName: activityNameController.text,
                          ),
                        );
                      }
                    },
                    color: AppColors.green,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
