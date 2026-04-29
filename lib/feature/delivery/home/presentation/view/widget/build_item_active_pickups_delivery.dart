import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/delivery/home/presentation/cubit/home_delivery_cubit.dart';
import 'package:canzo_app/feature/delivery/home/presentation/cubit/home_delivery_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildItemActivePickupsDelivery extends StatelessWidget {
  const BuildItemActivePickupsDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeDeliveryCubit(),
      child: BlocBuilder<HomeDeliveryCubit, HomeDeliveryState>(
        builder: (BuildContext context, state) {
          var cubit = context.read<HomeDeliveryCubit>();
          return Container(
            padding: EdgeInsets.only(top: 12, bottom: 20, right: 12, left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black45),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Moaz Mohamed', style: StyleText.style19, maxLines: 2),
                      Text('3 packages - plastic', style: StyleText.style13),
                      Text('Haram, Giza', style: StyleText.style13),
                      Text('27 Api 2026 - 07:09', style: StyleText.style13),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        cubit.changeSelectedActive(value);
                      },
                      itemBuilder: (context) => [
                        _buildItem(
                          AppStrings.inProgress.tr(),
                          Colors.red,
                          'in_progress',
                        ),
                        _buildItem(
                          AppStrings.preparing.tr(),
                          Colors.orange,
                          'preparing',
                        ),
                        _buildItem(
                          AppStrings.complete.tr(),
                          AppColors.green,
                          'complete',
                        ),
                      ],
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: state.selectedActiveType == 'preparing'
                              ? Colors.orange.shade50
                              : state.selectedActiveType == 'in_progress'
                              ? Colors.red.shade50
                              : Colors.green.shade50,

                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black45),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _getLabel(state.selectedActiveType),
                              style: StyleText.style13.copyWith(
                                color: state.selectedActiveType == 'preparing'
                                    ? Colors.orange.shade300
                                    : state.selectedActiveType == 'in_progress'
                                    ? Colors.pinkAccent.shade200
                                    : AppColors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            sizeBox(width: 5),
                            Icon(Icons.keyboard_arrow_down_outlined,size: 18,
                              color: state.selectedActiveType == 'preparing'
                                  ? Colors.orange.shade300
                                  : state.selectedActiveType == 'in_progress'
                                  ? Colors.pinkAccent.shade200
                                  : AppColors.green,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('${AppStrings.egp.tr()} 300', style: StyleText.style19),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  PopupMenuItem<String> _buildItem(String text, Color color, String value) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(Icons.circle, size: 10, color: color),
          SizedBox(width: 8),
          Text(text, style: TextStyle(color: color)),
        ],
      ),
    );
  }

  String _getLabel(String? key) {
    switch (key) {
      case "in_progress":
        return AppStrings.inProgress.tr();
      case "preparing":
        return AppStrings.preparing.tr();
      case "complete":
        return AppStrings.complete.tr();
      default:
        return AppStrings.complete.tr();
    }
  }
}
