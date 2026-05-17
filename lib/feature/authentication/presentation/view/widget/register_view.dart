import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/admin_register.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/delivery_register.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/user_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserRegister(state: state.selectedActivityType),
            ],
          ),
        );
      },
    );
  }
}

// Widget _buildRegisterForm(AppRole? role, AuthState state) {
//   switch (role) {
//     case AppRole.user:
//       return UserRegister(state: state.selectedActivityType);
//
//     case AppRole.admin:
//       return const AdminRegister();
//
//     case AppRole.delivery:
//       return const DeliveryRegister();
//
//     default:
//       return const SizedBox();
//   }
// }