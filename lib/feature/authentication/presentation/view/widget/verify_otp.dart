import 'dart:async';

import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/authentication/domain/cases/params.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/update_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpView extends StatefulWidget {
  final String email;

  const OtpView({super.key, required this.email});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Timer? timer;
  int seconds = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            if (state.status == AuthStates.successVerifyOtp) {
              showSnackBar(context: context, message: state.verify!.message);

              await Future.delayed(const Duration(seconds: 1));

              if (context.mounted) {
                navigateAndFinish(
                  context,
                  NewPasswordView(
                    resetToken: state.verify!.resetToken,
                    email: widget.email,
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeBox(),
                    Center(
                      child: Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          color: AppColors.green.withOpacity(.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.mark_email_read_outlined,
                          size: 55,
                          color: AppColors.green,
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Center(
                      child: Text(
                        "Verify OTP",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Center(
                      child: Text(
                        "Enter the verification code sent to",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Center(
                      child: Text(
                        widget.email,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    TextFormField(
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 6,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 10,
                      ),
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "------",
                        hintStyle: TextStyle(
                          letterSpacing: 10,
                          color: Colors.grey.shade400,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: AppColors.green,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 22,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter OTP";
                        }

                        if (value.length < 6) {
                          return "OTP must be 6 digits";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    buildMaterialButton(
                      text: 'Verify Code',
                      loading: state.status == AuthStates.loading,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          cubit.verifyOtp(
                            context,
                            VerifyOtpParams(
                              email: widget.email,
                              otp: otpController.text.trim(),
                            ),
                          );
                        }
                        print('widget.email ${widget.email}');
                      },
                      color: AppColors.green,
                    ),

                    const SizedBox(height: 25),

                    Center(
                      child: seconds > 0
                          ? RichText(
                              text: TextSpan(
                                text: "Resend code in ",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 15,
                                ),
                                children: [
                                  TextSpan(
                                    text: "$seconds s",
                                    style: TextStyle(
                                      color: AppColors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                setState(() {
                                  seconds = 60;
                                });

                                startTimer();

                                cubit.forgetPassword(
                                  context,
                                  ForgetPasswordParams(email: widget.email),
                                );
                              },
                              child: Text(
                                "Resend Code",
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
