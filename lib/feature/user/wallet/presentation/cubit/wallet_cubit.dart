import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/feature/user/wallet/domain/UseCase/get_transaction_use_case.dart';
import 'package:canzo_app/feature/user/wallet/domain/UseCase/get_wallet_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final GetTransactionUseCase _getTransactionUseCase;
  final GetWalletUseCase _getWalletUseCase;

  WalletCubit(
      this._getTransactionUseCase,
      this._getWalletUseCase,
      ) : super(const WalletState());


  void load(BuildContext context){
    getTransaction(context);
    getWallet(context);
  }

  Future<void> getTransaction(BuildContext context) async {
    emit(state.copyWith(status: WalletStates.loading));

    final response = await _getTransactionUseCase(NoParams());
    response.fold(
          (l) {
        emit(state.copyWith(failure: l, status: WalletStates.error));
      },
          (data) {
        emit(state.copyWith(transaction: data,status: WalletStates.success));
        pr(data);
      },
    );
  }

  Future<void> getWallet(BuildContext context) async {
    emit(state.copyWith(status: WalletStates.loading));

    final response = await _getWalletUseCase(NoParams());
    response.fold(
          (l) {
        emit(state.copyWith(failure: l, status: WalletStates.error));
      },
          (data) {
        emit(state.copyWith(wallet: data,status: WalletStates.success));
        pr(data);
      },
    );
  }
}
