import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/feature/authentication/domain/entity/app_role.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/view/login_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectRoleView extends StatelessWidget {
  const SelectRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    final isEnglish = locale.languageCode == 'en';

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.selectRole.tr()),
        actions: [
          TextButton(
            onPressed: () {
              context.setLocale(
                isEnglish ? const Locale('ar') : const Locale('en'),
              );
            },
            child: Text(isEnglish ? "AR" : "EN"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, AppStrings.user.tr(), AppRole.user),
              _buildButton(context, AppStrings.admin.tr(), AppRole.admin),
              _buildButton(context, AppStrings.delivery.tr(), AppRole.delivery),
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
        child: Text(title,
        style: TextStyle(
          fontSize: 25,
        ),
        ),
      ),
    );
  }
}
