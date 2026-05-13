import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/social_login_view.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/components.dart';
import 'custom_text_field.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key,});
  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthCubit,AuthState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<AuthCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: emailController,
              title: AppStrings.email.tr(),
              name: AppStrings.email.tr(),
              validate: '',
              type: TextInputType.emailAddress,
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
            Row(
              children: [
                Spacer(),
                Text(
                  AppStrings.forgetPassword.tr(),
                  style: TextStyle(color: AppColors.green),
                ),
              ],
            ),
            sizeBox(),
            buildMaterialButton(
              text: AppStrings.login.tr(),
              function: () {
                navigateAndFinish(context, BottomNavBar());
              },
              color: AppColors.green,
            ),
            SocialLoginView(),
          ],
        );
      },
    );
  }
}
