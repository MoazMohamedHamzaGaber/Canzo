import 'package:canzo_app/core/utils/color.dart';
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
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          body: cubit.screens[state.currentIndex!],
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
              items:  [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green.shade50,
                      border: Border.all()
                    ),
                    child:  Icon(
                      Icons.home,
                      color: AppColors.green,
                    ),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  activeIcon: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.shade50,
                        border: Border.all()
                    ),
                    child:  Icon(
                      Icons.history,
                      color: AppColors.green,
                    ),
                  ),
                  label: "History",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wallet),
                  activeIcon: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.shade50,
                        border: Border.all()
                    ),
                    child:  Icon(
                      Icons.wallet,
                      color: AppColors.green,
                    ),
                  ),
                  label: "Wallet",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  activeIcon: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.shade50,
                        border: Border.all()
                    ),
                    child:  Icon(
                      Icons.person_2_outlined,
                      color: AppColors.green,
                    ),
                  ),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
