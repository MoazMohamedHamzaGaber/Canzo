import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/profile/domain/UseCase/update_profile_use_case.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController activityTypeController;
  late TextEditingController activityNameController;

  @override
  void initState() {
    super.initState();

    final profile = BlocProvider.of<ProfileCubit>(context).state.profile;

    nameController = TextEditingController(text: profile?.userName ?? '');

    emailController = TextEditingController(text: profile?.email ?? '');

    phoneController = TextEditingController(text: profile?.phone ?? '');

    addressController = TextEditingController(text: profile?.address ?? '');

    activityTypeController = TextEditingController(
      text: profile?.activityType ?? '',
    );

    activityNameController = TextEditingController(
      text: profile?.activityName ?? '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    activityTypeController.dispose();
    activityNameController.dispose();

    super.dispose();
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $title';
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
      appBar: AppBar(title: const Text('Update Profile'), centerTitle: true),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStates.updateSuccess) {
            showSnackBar(
              context: context,
              message: 'Profile updated successfully',
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
                    title: 'User Name',
                    controller: nameController,
                  ),

                  buildTextField(
                    title: 'Email',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  buildTextField(
                    title: 'Phone Number',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                  ),

                  buildTextField(
                    title: 'Address',
                    controller: addressController,
                  ),

                  buildTextField(
                    title: 'Activity Type',
                    controller: activityTypeController,
                  ),

                  buildTextField(
                    title: 'Activity Name',
                    controller: activityNameController,
                  ),

                  const SizedBox(height: 20),

                  buildMaterialButton(
                    text: 'Update',
                    loading: state.status == ProfileStates.loading
                        ? true
                        : false,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        cubit.updateProfile(
                          context,
                          UpdateProfileParams(
                            username: nameController.text,
                            email: emailController.text,
                            phoneNumber: phoneController.text,
                            address: addressController.text,
                            activityType: activityTypeController.text,
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
