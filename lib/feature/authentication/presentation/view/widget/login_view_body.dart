import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/admin_login.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/delivery_login.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/user_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome back!', style: StyleText.style20()),
                sizeBox(height: 10),
                Text(
                  'Enter your credentials to access your account',
                  style: StyleText.style16,
                ),
                sizeBox(),
                _buildLoginForm(state.appRole, state),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildLoginForm(AppRole? role, AuthState state) {
  switch (role) {
    case AppRole.user:
      return UserLogin(state: state.selectedActivityType);

    case AppRole.admin:
      return const AdminLogin();

    case AppRole.delivery:
      return const DeliveryLogin();

    default:
      return const SizedBox();
  }
}