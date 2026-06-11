import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../../../../core/error/failure.dart';
import '../repository/overview_repository.dart';

class ApproveWithdrawUseCase extends UseCase<String, ApproveWithdrawParams> {
  final OverviewRepository repository;

  ApproveWithdrawUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(ApproveWithdrawParams params) {
    return repository.approveWithdraw(params);
  }
}

class ApproveWithdrawParams {
  final int withdrawId;
  final String status;
  final File? screenshot;

  const ApproveWithdrawParams({
    required this.withdrawId,
    required this.status,
     this.screenshot,
  });
}
