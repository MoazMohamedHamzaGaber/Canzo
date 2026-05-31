import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/core/widget/logo_and_name_app.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:canzo_app/feature/profile/presentation/cubit/profile_state.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/add_baskets_use_case.dart';
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
      body: BlocProvider(
        create: (BuildContext context) =>serviceLocator<ProfileCubit>()..getProfile(),
        child: BlocBuilder<ProfileCubit,ProfileState>(
          builder: (BuildContext context, profile) {
            final activityType =
                profile.profile?.activityType;

            final isWeddingHall =
                activityType?.toLowerCase() == 'wedding hall' ||
                    activityType == 'قاعة أفراح';

            final basketPrice = isWeddingHall ? 250 : 200;
            return BlocConsumer<HomeCubit, HomeState>(
              listener: (BuildContext context, HomeState state) async {
                if (state.status == HomeStates.addSuccess) {
                  showSnackBar(context: context, message: 'Add baskets successful');

                  context.read<HomeCubit>().resetState();

                  await Future.delayed(const Duration(seconds: 1));

                  if (context.mounted) {
                    navigateAndFinish(context, const BottomNavBar(initialIndex: 0));
                  }
                }
              },
              builder: (context, state) {
                final cubit = context.read<HomeCubit>();
                final selectedType =
                    state.selectedMaterialType ?? basketTypes.first.title;

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
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedType,
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 18,
                                  ),

                                  // Selected item UI
                                  selectedItemBuilder: (context) {
                                    return basketTypes.map((item) {
                                      return Row(
                                        children: [
                                          Image.asset(
                                            item.image,
                                            width: 28,
                                            height: 28,
                                            fit: BoxFit.contain,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            item.title,
                                            style: StyleText.style16,
                                          ),
                                        ],
                                      );
                                    }).toList();
                                  },

                                  // Dropdown items UI
                                  items: basketTypes.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item.title,
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            item.image,
                                            width: 28,
                                            height: 28,
                                            fit: BoxFit.contain,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            item.title,
                                            style: StyleText.style16,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),

                                  onChanged: (value) {
                                    cubit.changeSelectedMaterial(value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        sizeBox(),
                        buildItem(
                          title: state.selectedMaterialType != null
                              ? state.selectedMaterialType == AppStrings.plastic.tr()
                              ? 'Soon'
                              : '${AppStrings.basket.tr()} 4 ${AppStrings.kg.tr()} = '
                              '$basketPrice ${AppStrings.le.tr()}'
                              : 'Soon',
                          keyName: '4kg',
                        ),
                        sizeBox(),
                        buildMaterialButton(
                          text: AppStrings.confirmYourChoice.tr(),
                          loading: state.status == HomeStates.loading ? true : false,
                          function: () {
                            cubit.addBaskets(
                              context,
                              AddBasketsParams(
                                contentType: getContentType(state.selectedMaterialType),
                                contentWeight: state.selectedMaterialType != null
                                    ? state.selectedMaterialType ==
                                    AppStrings.plastic.tr()
                                    ? 2
                                    : 4
                                    : 2, amount: state.counters['4kg'] ?? 1,
                              ),
                            );
                          },
                          color: AppColors.green,
                        ),
                      ],              ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildItem({
    required String title,
    // required String subtitle,
    required String keyName,
  }) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Row(
          children: [
            Image.asset('assets/images/basket.png', width: 45, height: 45),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: StyleText.style18.copyWith(color: AppColors.green),
                  ),
                  //   Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            CounterField(
              value: state.counters[keyName] ?? 1,
              onIncrement: () => cubit.increment(keyName),
              onDecrement: () => cubit.decrement(keyName),
            ),
          ],
        );
      },
    );
  }

  String getContentType(String? selectedType) {
    if (selectedType == null) return 'Plastic';

    final type = selectedType.trim().toLowerCase();

    if (type == AppStrings.plastic.tr().toLowerCase() ||
        type == 'waters' ||
        type == 'مياه') {
      return 'Plastic';
    }

    if (type == AppStrings.cans.tr().toLowerCase() ||
        type == 'cans' ||
        type == 'canz' ||
        type == 'علب' ||
        type == 'كانز') {
      return 'Canz';
    }

    return 'Plastic';
  }
}

class BasketType {
  final String key;
  final String title;
  final String image;

  const BasketType({
    required this.key,
    required this.title,
    required this.image,
  });
}

final basketTypes = [
  BasketType(
    key: 'Plastic',
    title: AppStrings.plastic.tr(),
    image: 'assets/images/waters.jpeg',
  ),
  BasketType(
    key: 'Canz',
    title: AppStrings.cans.tr(),
    image: 'assets/images/canz.jpeg',
  ),
];