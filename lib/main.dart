import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/role_view.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(),),
        BlocProvider(create: (context) => HomeCubit(),),
        BlocProvider(create: (context) => ProfileCubit(),),
      ],
      child: MaterialApp(
        title: 'Canzo',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: const SelectRoleView(),
      ),
    );
  }
}
