import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Role")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, "User", AppRole.user),
              _buildButton(context, "Admin", AppRole.admin),
              _buildButton(context, "Delivery", AppRole.delivery),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, AppRole role) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthCubit>().selectRole(role);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
          );
        },
        child: Text(title),
      ),
    );
  }
}