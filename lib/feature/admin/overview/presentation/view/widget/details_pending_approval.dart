import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../domain/entity/order_entity.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});
  final OrderEntity order;


  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff2E7D32);

    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.orderDetails.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// STATUS CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.orange,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.pending_actions,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 12),
                   Expanded(
                    child: Text(
                      AppStrings.pending.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  Text(
                    '${order.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// CUSTOMER INFO
            SectionCard(
              title:AppStrings.customerInformation.tr(),
              icon: Icons.person_outline,
              children:  [
                InfoTile(
                  icon: Icons.person,
                  title: AppStrings.customerName.tr(),
                  value: order.userName,
                ),
                Divider(),
                InfoTile(
                  icon: Icons.phone,
                  title: AppStrings.phoneNumber.tr(),
                  value: order.phoneNumber,
                ),
                Divider(),
                InfoTile(
                  icon: Icons.location_on_outlined,
                  title: AppStrings.address.tr(),
                  value: order.address,
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// COLLECTION INFO
            SectionCard(
              title: AppStrings.collectionInformation.tr(),
              icon: Icons.recycling,
              children:  [
                InfoTile(
                  icon: Icons.shopping_basket_outlined,
                  title: AppStrings.basketsCount.tr(),
                  value: '${order.basketsCount}',
                ),
                Divider(),
                InfoTile(
                  icon: Icons.scale_outlined,
                  title: AppStrings.totalWeight.tr(),
                  value: '${order.totalWeight}',
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// STATISTICS
            SectionCard(
              title: AppStrings.materialStatistics.tr(),
              icon: Icons.bar_chart,
              children: [
                Row(
                  children:  [
                    Expanded(
                      child: _StatCard(
                        title: AppStrings.plastic.tr(),
                        value: '${order.plasticCount}',
                        icon: Icons.water_drop_outlined,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        title: AppStrings.cans.tr(),
                        value: '${order.canzCount}',
                        icon: Icons.local_drink_outlined,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// DATE
            SectionCard(
              title: AppStrings.orderInformation.tr(),
              icon: Icons.calendar_month,
              children:  [
                InfoTile(
                  icon: Icons.access_time,
                  title: AppStrings.createdAt.tr(),
                  value: order.createdAt,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const SectionCard({super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoTile({super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}