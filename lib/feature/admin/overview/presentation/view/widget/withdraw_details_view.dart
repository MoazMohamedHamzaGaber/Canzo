import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../domain/entity/withdraw_entity.dart';
import 'details_pending_approval.dart';

class WithdrawalDetailsView extends StatelessWidget {
  const WithdrawalDetailsView({
    super.key,
    required this.withdrawal,
  });

  final WithdrawalEntity withdrawal;

  @override
  Widget build(BuildContext context) {
    Color statusColor;

    switch (withdrawal.status.toLowerCase()) {
      case 'approved':
        statusColor = Colors.green;
        break;
      case 'rejected':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.orange;
    }

    return Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.withdrawalDetails.tr()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// STATUS
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: statusColor),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: statusColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      withdrawal.status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    '${withdrawal.amount.ceil()} ${AppStrings.egp.tr()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// USER INFO
            SectionCard(
              title: AppStrings.userInformation.tr(),
              icon: Icons.person,
              children: [
                InfoTile(
                  icon: Icons.person_outline,
                  title: AppStrings.userName.tr(),
                  value: withdrawal.userName,
                ),
                const Divider(),
                InfoTile(
                  icon: Icons.phone,
                  title: AppStrings.phoneNumber.tr(),
                  value: withdrawal.phoneNumber,
                ),
                const Divider(),
                InfoTile(
                  icon: Icons.wallet,
                  title: AppStrings.walletNumber.tr(),
                  value: withdrawal.walletNumber,
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// REQUEST INFO
            SectionCard(
              title: AppStrings.requestInformation.tr(),
              icon: Icons.receipt_long,
              children: [
                InfoTile(
                  icon: Icons.attach_money,
                  title: AppStrings.amount.tr(),
                  value: '${withdrawal.amount.ceil()} ${AppStrings.egp.tr()}',
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// DATES
            SectionCard(
              title: AppStrings.dates.tr(),
              icon: Icons.calendar_month,
              children: [
                InfoTile(
                  icon: Icons.access_time,
                  title: AppStrings.createdAt.tr(),
                  value: withdrawal.createdAt,
                ),
                const Divider(),
                InfoTile(
                  icon: Icons.update,
                  title: AppStrings.updatedAt.tr(),
                  value: withdrawal.updatedAt,
                ),
              ],
            ),

            if (withdrawal.screenshotPath != null &&
                withdrawal.screenshotPath!.isNotEmpty) ...[
              const SizedBox(height: 16),
              SectionCard(
                title: AppStrings.transferScreenshot.tr(),
                icon: Icons.image,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      withdrawal.screenshotPath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}