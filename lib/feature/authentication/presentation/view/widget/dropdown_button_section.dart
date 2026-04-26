import 'package:canzo_app/feature/authentication/presentation/cubit/auth_cubit.dart';
import 'package:canzo_app/feature/authentication/presentation/cubit/auth_state.dart';
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
              'نوع النشاط',
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
                hint:  Text('اختر نوع النشاط',
                  style: TextStyle(
                    color: Colors.black
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
                initialValue: cubit.state.selectedActivityType,
                items: const [
                  DropdownMenuItem(
                    value: 'مطعم',
                    child: Text('مطعم'),
                  ),
                  DropdownMenuItem(
                    value: 'كافية',
                    child: Text('كافية'),
                  ),
                  DropdownMenuItem(
                    value: 'قاعة افراح',
                    child: Text('قاعة افراح'),
                  ),
                  DropdownMenuItem(
                    value: 'نادي',
                    child: Text('نادي'),
                  ),
                ],
                onChanged: (value) {
                  cubit.changeSelectedActivity(value);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
