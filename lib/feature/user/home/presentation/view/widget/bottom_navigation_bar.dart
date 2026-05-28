import 'package:canzo_app/core/config/role_config.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    this.initialIndex = 0,
  });

  final int initialIndex;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().changeCurrentIndex(
      widget.initialIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) {
        final cubit = context.read<HomeCubit>();

        return Scaffold(
          body: RoleConfig.screens(role!)[state.currentIndex ?? 0],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: state.currentIndex ?? 0,
              onTap: (index) {
                cubit.changeCurrentIndex(index);
              },
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.shifting,
              items: RoleConfig.items(role!),
            ),
          ),
        );
      },
    );
  }
}