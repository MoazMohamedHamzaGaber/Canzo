import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DropdownButtonPickup extends StatelessWidget {
  const DropdownButtonPickup({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
        var cubit=context.read<HomeCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.material.tr(),
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
              child: DropdownButtonFormField(
                hint:  Text(AppStrings.selectMaterial.tr()),
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                borderRadius: BorderRadius.circular(20),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                initialValue: cubit.state.selectedMaterialType,
                items:  [
                  DropdownMenuItem(
                    value: 'Plastic',
                    child: Text(AppStrings.plastic.tr()),
                  ),
                  DropdownMenuItem(
                    value: 'Canz',
                    child: Text(AppStrings.cans.tr()),
                  ),
                ],
                onChanged: (value) {
                  cubit.changeSelectedMaterial(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
