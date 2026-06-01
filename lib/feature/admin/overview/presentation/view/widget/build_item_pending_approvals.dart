import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/utils/color.dart';
import 'package:canzo_app/core/utils/components.dart';
import 'package:canzo_app/core/utils/const.dart';
import 'package:canzo_app/core/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:canzo_app/feature/admin/overview/domain/entity/order_entity.dart';
import 'package:canzo_app/feature/admin/overview/presentation/cubit/overview_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/useCase/update_order_use_case.dart';

class BuildItemPendingApprovals extends StatelessWidget {
  final OrderEntity order;

  const BuildItemPendingApprovals({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 20,
        right: 12,
        left: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black45),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.userName,
                      style: StyleText.style19.copyWith(
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 5,),


                    Text(
                      "Basket Count: ${order.basketsCount} - ${order.address}",
                      style: StyleText.style13,
                    ),
                    SizedBox(height: 5,),
                    Text(
                      order.createdAt,
                      style: StyleText.style13,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "${order.totalWeight!.ceil()} ${AppStrings.kg.tr()}",
                    style: StyleText.style18.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    '${order.price} ${AppStrings.egp.tr()}',
                    style: StyleText.style19.copyWith(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ],
          ),

          sizeBox(),

          Row(
            children: [
              Expanded(
                child: buildMaterialButton(
                  text: AppStrings.cancel.tr(),
                  color: Colors.red,
                  function: () {
                    context
                        .read<OverviewCubit>()
                        .updateOrder(
                      UpdateOrderParams(
                        orderId: order.id,
                        status: 'Cancelled',
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: buildMaterialButton(
                  text: AppStrings.complete.tr(),
                  color: AppColors.green,
                  function: () {
                    _showCompleteDialog(
                      context,
                      order.id,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCompleteDialog(
      BuildContext context,
      int orderId,
      ) {
    // هنا تفتح Dialog اختيار الصورة
  }
}

