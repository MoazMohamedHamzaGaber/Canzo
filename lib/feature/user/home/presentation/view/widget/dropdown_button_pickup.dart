import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
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
              'Material',
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
                hint:  Text('Select material'),
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                borderRadius: BorderRadius.circular(20),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                initialValue: cubit.state.selectedMaterialType,
                items: const [
                  DropdownMenuItem(
                    value: 'Plastic',
                    child: Text('Plastic'),
                  ),
                  DropdownMenuItem(
                    value: 'Canz',
                    child: Text('Canz'),
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
