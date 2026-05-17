import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/shared/shared_preference.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/view/widget/role_view.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.execute();
  await EasyLocalization.ensureInitialized();
  await SharedPreference.init();


  token=SharedPreference.getData(key: 'token');
  role=SharedPreference.getData(key: 'role');
  print(token);
  print(role);


  Widget startWidget =
  token != null ? const BottomNavBar() : const SelectRoleView();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MyApp(startWidget: startWidget),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<AuthCubit>(),),
        BlocProvider(create: (context) => serviceLocator<HomeCubit>()),
        BlocProvider(create: (context) => ProfileCubit(),),
      ],
      child: MaterialApp(
        title: 'Canzo',
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: SelectRoleView(),
      ),
    );
  }
}
