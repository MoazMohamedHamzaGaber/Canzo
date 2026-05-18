import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/login_view.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key, required this.resetToken, required this.email});
  final String resetToken;
  final String email;

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Password")),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state.status == AuthStates.successForgetPassword) {
            showSnackBar(context: context, message: 'Password reset successful');
            await Future.delayed(const Duration(seconds: 2));

            if (context.mounted) {
              navigateAndFinish(context, LoginView());
            }
          }
        },
        builder: (BuildContext context, state) {
          var cubit = context.read<AuthCubit>();
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
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
                  sizeBox(),
                  buildMaterialButton(
                    text: 'Confirm',
                    loading: state.status == AuthStates.loading ? true : false,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        cubit.resetPassword(
                          context,
                          ResetPasswordParams(
                            email: widget.email,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                            resetToken: widget.resetToken,
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
