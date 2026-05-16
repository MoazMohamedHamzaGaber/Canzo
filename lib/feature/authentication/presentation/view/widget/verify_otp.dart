import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
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
  int seconds = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (seconds > 0) {
        setState(() => seconds--);
        return true;
      }
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Code")),
      body: BlocConsumer<AuthCubit,AuthState>(
         listener: (BuildContext context, state) {
           // if (state.status ==AuthStates.verifyOtp) {
           //   Navigator.push(
           //     context,
           //     MaterialPageRoute(
           //       builder: (_) => NewPasswordView(),
           //     ),
           //   );
           // }
         },
        builder: (BuildContext context, state) {
           return Padding(
             padding: const EdgeInsets.all(20),
             child: Column(
               children: [
                 const SizedBox(height: 30),

                 Text(
                   "Enter the code sent to your email",
                   style: TextStyle(fontSize: 16),
                 ),

                 const SizedBox(height: 30),

                 TextField(
                   controller: otpController,
                   keyboardType: TextInputType.number,
                   maxLength: 8,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: "Enter OTP",
                   ),
                 ),

                 const SizedBox(height: 20),

                 ElevatedButton(
                   onPressed: () {
                     // context.read<AuthCubit>().verifyCode(
                     //   widget.email,
                     //   otpController.text,
                     // );
                   },
                   child: const Text("Verify"),
                 ),

                 const SizedBox(height: 20),

                 seconds > 0
                     ? Text("Resend code in $seconds s")
                     : TextButton(
                   onPressed: () {
                     // context.read<AuthCubit>().resendOtp(widget.email);
                     // setState(() => seconds = 60);
                     // startTimer();
                   },
                   child: const Text("Resend Code"),
                 ),
               ],
             ),
           );
        },
      ),
    );
  }
}