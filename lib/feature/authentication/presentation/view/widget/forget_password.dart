import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/custom_text_field.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/verify_otp.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Forget Password')),
      body: BlocConsumer<AuthCubit,AuthState>(
        listener: (BuildContext context, state) async{
          if (state.status == AuthStates.success) {
            showSnackBar(
              context: context,
              message: 'OTP sent successfully',
            );
            await Future.delayed(const Duration(seconds: 2));

            if(context.mounted){
              navigateAndFinish(context, OtpView(
                email: emailController.text,
              ));
            }
          }
        },
        builder: (BuildContext context, state) {
           return Form(
             key: formKey,
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: Column(
                 children: [
                   CustomTextField(
                     controller: emailController,
                     title: AppStrings.email.tr(),
                     name: AppStrings.email.tr(),
                     validate: '',
                     type: TextInputType.emailAddress,
                   ),
                   sizeBox(),
                   buildMaterialButton(
                     text: 'Confirm',
                    loading:state.status == AuthStates.loading? true : false,
                     function: () {
                       if (formKey.currentState!.validate()) {
                         cubit.forgetPassword(
                           context,
                           ForgetPasswordParams(
                             email: emailController.text,
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
