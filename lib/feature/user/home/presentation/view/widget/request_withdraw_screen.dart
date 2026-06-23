import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/core/utils/app_strings.dart';
import 'package:canzo_app/core/widget/snake_bar.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/request_withdraw_use_case.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/color.dart';
import '../../../../../../core/utils/components.dart';
import '../../../../../../core/utils/const.dart';

class WithdrawRequestView extends StatefulWidget {
  const WithdrawRequestView({super.key});

  @override
  State<WithdrawRequestView> createState() => _WithdrawRequestViewState();
}

class _WithdrawRequestViewState extends State<WithdrawRequestView> {
  final amountController = TextEditingController();
  final walletController = TextEditingController();

  String? selectedMethod;

  final methods = [
    AppStrings.vodafoneCash.tr(),
    AppStrings.etisalatCash.tr(),
    AppStrings.orangeCash.tr(),
    AppStrings.instaPay.tr(),
  ];

  @override
  void dispose() {
    amountController.dispose();
    walletController.dispose();
    super.dispose();
  }

  void submitRequest() {
    if (amountController.text.isEmpty ||
        walletController.text.isEmpty ||
        selectedMethod == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar( SnackBar(content: Text(AppStrings.pleaseFillAllFields.tr())));
      return;
    }

    debugPrint('Amount: ${amountController.text}');
    debugPrint('Wallet: ${walletController.text}');
    debugPrint('Method: $selectedMethod');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(AppStrings.withdrawRequests.tr())),
      body: BlocProvider(
        create: (BuildContext context) => serviceLocator<HomeCubit>(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (BuildContext context, state) {
            if(state.status == HomeStates.addSuccess){
              showSnackBar(context: context, message: AppStrings.requestWithdrawSuccessful.tr());
            }
          },
          builder: (BuildContext context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                     AppStrings.withdrawalDetails.tr(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: AppStrings.amount.tr(),
                      hintText: AppStrings.enterAmount.tr(),
                      prefixIcon: const Icon(Icons.attach_money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    initialValue: selectedMethod,
                    decoration: InputDecoration(
                      labelText: AppStrings.withdrawalMethod.tr(),
                      prefixIcon: const Icon(Icons.account_balance_wallet),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: methods
                        .map(
                          (method) => DropdownMenuItem(
                            value: method,
                            child: Text(method),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMethod = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: walletController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: selectedMethod == AppStrings.instaPay.tr()
                          ? AppStrings.instapayNumber.tr()
                          : AppStrings.walletNumber.tr(),

                      hintText: selectedMethod == AppStrings.instaPay.tr()
                          ? AppStrings.enterInstapayNumber.tr()
                          : AppStrings.enterWalletNumber.tr(),
                      prefixIcon: const Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  sizeBox(),
                  Text('*${AppStrings.moneyTransfer.tr()}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red
                  ),
                  ),
                  sizeBox(height: 5),
                  buildMaterialButton(
                    text: AppStrings.submitRequest.tr(),
                    loading: state.status == HomeStates.loading ? true : false,
                    function: () {
                      if (amountController.text.isEmpty ||
                          walletController.text.isEmpty ||
                          selectedMethod == null) {
                        showSnackBar(
                          context: context,
                          message: AppStrings.pleaseFillAllFields.tr(),
                          backgroundColor: Colors.red,
                        );
                        return;
                      }

                      debugPrint('Amount: ${amountController.text}');
                      debugPrint('Wallet: ${walletController.text}');
                      debugPrint('Method: $selectedMethod');

                      context.read<HomeCubit>().requestWithdraw(
                        context,
                        RequestWithdrawParams(
                          amount: int.parse(amountController.text),
                          number: walletController.text,
                        ),
                      );
                    },
                    color: AppColors.green,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
