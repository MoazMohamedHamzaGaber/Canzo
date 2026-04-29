import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/core/widget/logo_and_name_app.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/bottom_navigation_bar.dart';
import 'package:canzo_app/feature/user/home/presentation/view/widget/counter_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectBasketView extends StatelessWidget {
  const SelectBasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Center(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogoAndNameApp(),
                  Text(
                    AppStrings.chooseTheBaskets.tr(),
                    style: StyleText.style20(color: AppColors.green),
                  ),
                  Text(
                    AppStrings.choseTypeBasket.tr(),
                    style: StyleText.style18.copyWith(color: AppColors.grey),
                  ),
                  sizeBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(AppStrings.basketType.tr()),
                      sizeBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade100),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: DropdownButton<String>(
                          value: state.selectedMaterialType ?? AppStrings.plastic.tr(),
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 18,
                          ),
                          underline: const SizedBox(),
                          items: [AppStrings.plastic.tr(), AppStrings.cans.tr()]
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            cubit.changeSelectedMaterial(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  sizeBox(),
                  buildItem(
                    title: AppStrings.twoKgBasket.tr(),
                    subtitle: AppStrings.forSmallWaste.tr(),
                    keyName: '2kg',
                  ),
                  sizeBox(),
                  buildItem(
                    title: AppStrings.fiveKgBasket.tr(),
                    subtitle: AppStrings.forMediumWaste.tr(),
                    keyName: '5kg',
                  ),
                  sizeBox(),
                  buildItem(
                    title: AppStrings.tenKgBasket.tr(),
                    subtitle: AppStrings.forLargeWaste.tr(),
                    keyName: '10kg',
                  ),
                  sizeBox(),
                  buildMaterialButton(
                    text: AppStrings.confirmYourChoice.tr(),
                    function: () {
                      navigateAndFinish(context, BottomNavBar());
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

  Widget buildItem({
    required String title,
    required String subtitle,
    required String keyName,
  }) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Row(
          children: [
            Image.asset('assets/images/basket.jpg', width: 40, height: 40),
            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: StyleText.style18.copyWith(color: AppColors.green),
                  ),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            CounterField(
              value: state.counters[keyName]!,
              onIncrement: () => cubit.increment(keyName),
              onDecrement: () => cubit.decrement(keyName),
            ),
          ],
        );
      },
    );
  }
}


