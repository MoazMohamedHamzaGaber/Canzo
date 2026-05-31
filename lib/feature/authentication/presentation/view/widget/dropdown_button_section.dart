import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/feature/authentication/domain/entity/activity_type.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DropdownButtonSection extends StatelessWidget {
  const DropdownButtonSection({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
        var cubit=context.read<AuthCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.activityType.tr(),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              child: DropdownButtonFormField<ActivityType>(
                hint:  Text(AppStrings.selectActivityType.tr(),
                  style: TextStyle(
                    color: Colors.black54
                  )
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                borderRadius: BorderRadius.circular(20),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                value: cubit.state.selectedActivityType,
                items:  [
                  DropdownMenuItem(
                    value:ActivityType.restaurant,
                    child: Text(AppStrings.restaurant.tr()),
                  ),
                  DropdownMenuItem(
                    value: ActivityType.cafe,
                    child: Text(AppStrings.cafe.tr()),
                  ),
                  DropdownMenuItem(
                    value: ActivityType.weddingHall,
                    child: Text(AppStrings.weddingHall.tr()),
                  ),
                  DropdownMenuItem(
                    value: ActivityType.club,
                    child: Text(AppStrings.club.tr()),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    cubit.changeSelectedActivity(value);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
