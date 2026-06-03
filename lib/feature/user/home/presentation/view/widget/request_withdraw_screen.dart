import 'package:canzo_app/core/service/service_locator.dart';
import 'package:canzo_app/feature/user/home/domain/usecases/request_withdraw_use_case.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_cubit.dart';
import 'package:canzo_app/feature/user/home/presentation/cubit/home_state.dart';
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

  final methods = const [
    'Vodafone Cash',
    'Etisalat Cash',
    'Orange Cash',
    'InstaPay',
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
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    debugPrint('Amount: ${amountController.text}');
    debugPrint('Wallet: ${walletController.text}');
    debugPrint('Method: $selectedMethod');

    // Call API / Cubit here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Withdraw Request')),
      body: BlocProvider(
        create: (BuildContext context) => serviceLocator<HomeCubit>(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Withdrawal Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 24),

                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      hintText: 'Enter amount',
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
                      labelText: 'Withdrawal Method',
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
                      labelText: selectedMethod == 'InstaPay'
                          ? 'InstaPay Number'
                          : 'Wallet Number',
                      hintText: selectedMethod == 'InstaPay'
                          ? 'Enter InstaPay number'
                          : 'Enter wallet number',
                      prefixIcon: const Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  sizeBox(),
                  buildMaterialButton(
                    text: 'Submit Request',
                    loading: state.status == HomeStates.loading ? true : false,
                    function: () {
                      if (amountController.text.isEmpty ||
                          walletController.text.isEmpty ||
                          selectedMethod == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all fields'),
                          ),
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
