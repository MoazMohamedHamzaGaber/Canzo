import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_strings.dart';

class BuildItemBaskets extends StatelessWidget {
  const BuildItemBaskets({
    super.key,
    required this.title,
    required this.value,
    required this.id,
    required this.subTitle,
    required this.price,
  });

  final String title;
  final String subTitle;
  final bool value;
  final int id;
  final int price;

  Future<void> _showRatingDialog(BuildContext context) async {
    int selectedRating = 0;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(AppStrings.rateBasket.tr()),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      final starIndex = index + 1;
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            selectedRating = starIndex;
                          });
                        },
                        icon: Icon(
                          selectedRating >= starIndex
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 32,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                  ),
                  child: Text(
                    AppStrings.confirm.tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 6, right: 12, left: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black45),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/basket.png', width: 50, height: 50),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: StyleText.style19),
                    Text(
                      '${AppStrings.price.tr()}: $price ${AppStrings.le.tr()}',
                      style: StyleText.style16.copyWith(color: AppColors.green),
                    ),
                    Text(subTitle, style: StyleText.style13),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final result = await showDialog<bool>(
                          context: context,
                          builder: (dialogContext) {
                            return AlertDialog(
                              title: Text(AppStrings.confirm.tr()),
                              content: Text(
                                AppStrings.doDeleteBasket.tr(),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext, false);
                                  },
                                  child: Text(
                                    AppStrings.cancels.tr(),
                                    style: TextStyle(color: AppColors.green),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext, true);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: Text(
                                    AppStrings.delete.tr(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          },
                        );

                        if (result == true && context.mounted) {
                          context.read<HomeCubit>().deleteBaskets(context, id);
                        }
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    sizeBox(height: 8),
                    Switch(
                      value: value,
                      padding: EdgeInsets.zero,
                      activeThumbColor: Colors.green,
                      onChanged: (newValue) async {
                        if (!this.value) {
                          final result = await showDialog<bool>(
                            context: context,
                            builder: (dialogContext) {
                              return AlertDialog(
                                title: Text(AppStrings.confirm.tr()),
                                content: Text(
                                  AppStrings.doWantFill.tr(),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(dialogContext, false);
                                    },
                                    child: Text(
                                      AppStrings.cancels.tr(),
                                      style: TextStyle(color: AppColors.green),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(dialogContext, true);
                                    },
                                    child: Text(
                                      AppStrings.confirm.tr(),
                                      style: TextStyle(color: AppColors.green),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );

                          if (result == true && context.mounted) {
                            context.read<HomeCubit>().fillBaskets(context, id);
                            await _showRatingDialog(context);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}