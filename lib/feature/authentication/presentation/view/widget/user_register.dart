import 'package:canzo_app/core/shared/shared_preference.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/social_login_view.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/select_basket_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dropdown_button_section.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key, this.state});

  final state;

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var activityNameController = TextEditingController();
  var addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, AuthState state) async {
        if (state.status == AuthStates.successSignUp) {
          final authCubit = context.read<AuthCubit>();
          showSnackBar(
            context: context,
            message: AppStrings.accountCreatedSuccessfully.tr(),
          );
          await Future.delayed(const Duration(seconds: 1));

          await authCubit.signIn(
            context,
            SignInParams(
              identifier: emailController.text,
              password: passwordController.text,
            ),
          );

          if (!context.mounted) return;

          final loginUser = authCubit.state.user;

          if (loginUser == null) return;

          await SharedPreference.saveData(key: 'token', value: loginUser.token);

          await SharedPreference.saveData(
            key: 'role',
            value: loginUser.userRole,
          );

          token = loginUser.token;
          role = loginUser.userRole;

          if (context.mounted) {
            navigateAndFinish(context, const SelectBasketView());
          }
        }
      },
      builder: (BuildContext context, state) {
        var cubit = context.read<AuthCubit>();
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: nameController,
                title: AppStrings.fullName.tr(),
                name: AppStrings.fullName.tr(),
                validate: '',
                type: TextInputType.name,
              ),
              CustomTextField(
                controller: emailController,
                title: AppStrings.email.tr(),
                name: AppStrings.email.tr(),
                validate: '',
                type: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: phoneController,
                title: AppStrings.phoneNumber.tr(),
                name: AppStrings.phoneNumber.tr(),
                validate: '',
                type: TextInputType.phone,
              ),
              CustomTextField(
                controller: passwordController,
                title: AppStrings.password.tr(),
                name: '***********',
                validate: '',
                obscureText: cubit.obscurePassword,
                type: TextInputType.visiblePassword,
                icon: IconButton(
                  onPressed: () {
                    cubit.changePasswordObscure();
                  },
                  icon: Icon(
                    cubit.obscurePassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                ),
              ),
              CustomTextField(
                controller: confirmPasswordController,
                title: AppStrings.confirmPassword.tr(),
                name: '***********',
                validate: '',
                obscureText: cubit.obscureConfirmPassword,
                type: TextInputType.visiblePassword,
                icon: IconButton(
                  onPressed: () {
                    cubit.changeConfirmPasswordObscure();
                  },
                  icon: Icon(
                    cubit.obscureConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.grey,
                  ),
                ),
              ),
              sizeBox(height: 10),
              DropdownButtonSection(),
              if (widget.state != null)
                CustomTextField(
                  controller: activityNameController,
                  title: getActivityLabel(widget.state!),
                  name: getActivityLabel(widget.state!),
                  validate: '',
                  type: TextInputType.text,
                ),
              CustomTextField(
                controller: addressController,
                title: AppStrings.address.tr(),
                name: AppStrings.address.tr(),
                validate: '',
                type: TextInputType.text,
              ),
              sizeBox(),
              buildMaterialButton(
                text: AppStrings.createAccount.tr(),
                loading: state.status == AuthStates.loading ? true : false,
                function: () {
                  if (formKey.currentState!.validate()) {
                    if (state.selectedActivityType?.apiValue == null) {
                      showSnackBar(
                        context: context,
                        message: AppStrings.pleaseSelectActivityType.tr(),
                        backgroundColor: Colors.red,
                      );
                    } else {
                      cubit.signUp(
                        context,
                        SignUpParams(
                          username: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                          phoneNumber: phoneController.text,
                          address: addressController.text,
                          activityType: state.selectedActivityType!.apiValue,
                          activityName: activityNameController.text,
                        ),
                      );
                    }
                  }
                },
                color: AppColors.green,
              ),
              SocialLoginView(),
            ],
          ),
        );
      },
    );
  }
}
