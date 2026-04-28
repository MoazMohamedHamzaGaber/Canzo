import 'package:canzo_app/core/config/role_config.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (BuildContext context, state) {
        final cubit = context.read<HomeCubit>();
        final role = context.read<AuthCubit>().state.appRole;

        return Scaffold(
          body: RoleConfig.screens(role!)[state.currentIndex ?? 0],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: state.currentIndex!,
              onTap: (index){
                cubit.changeCurrentIndex(index);
              },
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.shifting,
              items:  RoleConfig.items(role),
            ),
          ),
        );
      },
    );
  }
}