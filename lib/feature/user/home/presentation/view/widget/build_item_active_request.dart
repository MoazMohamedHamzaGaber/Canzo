import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildItemActiveRequest extends StatelessWidget {
  const BuildItemActiveRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, state) {
          var cubit = context.read<HomeCubit>();
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black45),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/logo.jpg', width: 50, height: 50),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3 packages - plastic ',
                        style: StyleText.style19,
                        maxLines: 2,
                      ),
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
                        _buildItem(AppStrings.inProgress.tr(), AppColors.green,'in_progress'),
                        _buildItem(AppStrings.preparing.tr(), Colors.orange, 'preparing'),
                        _buildItem(AppStrings.complete.tr(), AppColors.green, 'complete'),
                      ],
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 25,
                        ),
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: state.selectedActiveType == 'preparing'
                              ? Colors.orange.shade50
                              : Colors.green.shade50,

                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black45),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _getLabel(state.selectedActiveType),
                              style: StyleText.style13.copyWith(
                                color: state.selectedActiveType =='preparing'
                                    ? Colors.orange
                                    : AppColors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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

  PopupMenuItem<String> _buildItem(
      String text,
      Color color,
      String value,
      ) {
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
