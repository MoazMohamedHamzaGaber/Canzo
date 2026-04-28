import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/role_view.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => HomeCubit(),),
      ],
      child: MaterialApp(
        title: 'Canzo',
        debugShowCheckedModeBanner: false,
        home: const SelectRoleView(),
      ),
    );
  }
}
