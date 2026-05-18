import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildItemBaskets extends StatelessWidget {
  const BuildItemBaskets({super.key, required this.title, required this.value, required this.id, required this.subTitle});
  final String title;
  final String subTitle;
  final bool value;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 12,
          bottom: 20,
          right: 12,
          left: 12
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black45),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/basket.png', width: 50, height: 50,),
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: StyleText.style19,
                    ),
                    Text(subTitle,
                      style: StyleText.style13,
                    ),
                  ],
                ),
                Spacer(),
                Switch(
                    value: value,
                    activeThumbColor: Colors.green,
                  onChanged: (value) async {
                    if (!this.value) {
                      context.read<HomeCubit>().fillBaskets(
                        context,
                        id,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
