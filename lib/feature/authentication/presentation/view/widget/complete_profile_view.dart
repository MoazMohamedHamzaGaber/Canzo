import 'package:canzo_app/core/widget/empty_screen.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/components.dart';
import '../../../../../core/utils/const.dart';
import '../../../../../core/widget/snake_bar.dart';
import '../../../../user/home/presentation/view/widget/bottom_navigation_bar.dart';
import '../../../domain/cases/set_up_profile_use_case.dart';
import '../../../domain/entity/activity_type.dart';
import '../../cubit/auth_cubit.dart';
import 'dropdown_button_section.dart';

class CompleteProfileView extends StatefulWidget {
  const CompleteProfileView({super.key});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  final addressController = TextEditingController();
  final activityNameController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? selectedActivity;

  final List<String> activities = [
    AppStrings.restaurant.tr(),
    AppStrings.cafe.tr(),
    AppStrings.weddingHall.tr(),
    AppStrings.club.tr(),
  ];

  @override
  void dispose() {
    addressController.dispose();
    activityNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.completeProfile.tr())),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (BuildContext context, state) async {
          if (state.status == AuthStates.successProfile) {
            showSnackBar(
              context: context,
              message: AppStrings.loginSuccess.tr(),
            );

            await Future.delayed(const Duration(seconds: 1));

            if (context.mounted) {
              navigateAndFinish(context, const BottomNavBar(initialIndex: 0));
            }
          }

          if (state.status == AuthStates.error) {
            EmptyScreen(title: state.failure!.errMessage);
          }
        },
        builder: (BuildContext context, state) {
          return Form(
            key: formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        labelText: AppStrings.address.tr(),
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 16),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: AppStrings.phone.tr(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonSection(),

                    // DropdownButtonFormField<String>(
                    //   initialValue: selectedActivity,
                    //   decoration:  InputDecoration(
                    //     labelText: AppStrings.activityType.tr(),
                    //     border: OutlineInputBorder(),
                    //   ),
                    //   items: activities.map((activity) {
                    //     return DropdownMenuItem(
                    //       value: activity,
                    //       child: Text(activity),
                    //     );
                    //   }).toList(),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       selectedActivity = value;
                    //     });
                    //   },
                    // ),
                    const SizedBox(height: 16),

                    TextFormField(
                      controller: activityNameController,
                      decoration: InputDecoration(
                        labelText: AppStrings.activityName.tr(),
                        border: OutlineInputBorder(),
                      ),
                    ),

                    sizeBox(),
                    buildMaterialButton(
                      text: AppStrings.confirm.tr(),
                      loading: state.status == AuthStates.loadingProfile
                          ? true
                          : false,
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          if (state.selectedActivityType?.apiValue == null) {
                            showSnackBar(
                              context: context,
                              message: AppStrings.pleaseSelectActivityType.tr(),
                              backgroundColor: Colors.red,
                            );
                          } else {
                            context.read<AuthCubit>().setupProfile(
                              context,
                              SetupProfileParams(
                                address: addressController.text,
                                activityType: state.selectedActivityType!.apiValue,
                                activityName: activityNameController.text,
                                phone: phoneController.text,
                              ),
                            );
                          }
                        }
                      },
                      color: AppColors.green,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
