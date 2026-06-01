import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/abstract/use_case.dart';
import '../../../../../core/error/failure.dart';
import '../repository/overview_repository.dart';

class UpdateOrderUseCase extends UseCase<String, UpdateOrderParams> {
  final OverviewRepository repository;

  UpdateOrderUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(UpdateOrderParams params) {
    return repository.updateOrder(params);
  }
}

class UpdateOrderParams {
  final int orderId;
  final String status;
  final File? image;

  const UpdateOrderParams({
    required this.orderId,
    required this.status,
    this.image,
  });
}
