import 'package:canzo_app/feature/authentication/presentation/view/widget/login_and_register_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginAndRegisterViewBody(),
    );
  }
}
