import 'package:canzo_app/core/abstract/use_case.dart';
import 'package:canzo_app/core/api/print_helper.dart';
import 'package:canzo_app/feature/user/wallet/domain/UseCase/get_transaction_use_case.dart';
import 'package:canzo_app/feature/user/wallet/domain/UseCase/get_wallet_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/UseCase/get_withdraw_use_case.dart';
import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final GetTransactionUseCase _getTransactionUseCase;
  final GetWalletUseCase _getWalletUseCase;
  final GetWithdrawUseCase _getWithdrawUseCase;

  WalletCubit(
      this._getTransactionUseCase,
      this._getWalletUseCase,
      this._getWithdrawUseCase,
      ) : super(const WalletState());


  Future<void> load(BuildContext context) async{
    await  getTransaction(context);
    await getWallet(context);
    await getWithdraw(context);
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

  Future<void> getWithdraw(BuildContext context) async {
    emit(state.copyWith(status: WalletStates.loading));

    final response = await _getWithdrawUseCase(NoParams());
    response.fold(
          (l) {
        emit(state.copyWith(failure: l, status: WalletStates.error));
      },
          (data) {
        emit(state.copyWith(withdraw: data,status: WalletStates.success));
      },
    );
  }
}
