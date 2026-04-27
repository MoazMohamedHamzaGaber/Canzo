import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/dropdown_button_section.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color.dart';
import '../../../../../core/utils/components.dart';
import 'custom_text_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var phoneController = TextEditingController();

  var passwordController = TextEditingController();
  var activityNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
       listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
         var cubit = context.read<AuthCubit>();
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
                 CustomTextField(
                   controller: phoneController,
                   title: 'رقم الهاتف',
                   name: 'رقم الهاتف',
                   validate: '',
                   type: TextInputType.phone,
                 ),
                 sizeBox(height: 10),
                 DropdownButtonSection(),
                 if (cubit.state.selectedActivityType != null &&
                     cubit.state.selectedActivityType!.isNotEmpty)
                   CustomTextField(
                     controller: activityNameController,
                     title: getActivityLabel(cubit.state.selectedActivityType!),
                     name: getActivityLabel(cubit.state.selectedActivityType!),
                     validate: '',
                     type: TextInputType.text,
                   ),
                 CustomTextField(
                   controller: passwordController,
                   title: 'Password',
                   name: '**********',
                   validate: '',
                   obscureText: true,
                   type: TextInputType.visiblePassword,
                 ),
                 TextButton(onPressed: () {}, child: Text('Forget Password?',
                   style: TextStyle(
                     color: AppColors.green,
                   ),
                 )),
                 sizeBox(),
                 buildMaterialButton(
                   text: 'Sign in',
                   function: () {
                     navigateTo(context, BottomNavBar());
                   },
                   color: AppColors.green,
                 ),
               ],
             ),
           ),
         );
      },
    );
  }


}
