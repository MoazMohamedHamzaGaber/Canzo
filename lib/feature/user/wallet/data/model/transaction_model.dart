import 'package:canzo_app/feature/user/wallet/domain/entity/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel({
    required super.allTransactions,
    required super.lastMonthTransactions,
    required super.lastWeekTransactions,
    required super.todayTransactions,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      allTransactions: (json['all_transactions'] as List<dynamic>? ?? [])
          .map((e) => AllTransactionModel.fromJson(e))
          .toList(),

      lastMonthTransactions:
      (json['last_month_transactions'] as List<dynamic>? ?? [])
          .map((e) => LastMonthTransactionsModel.fromJson(e))
          .toList(),

      lastWeekTransactions:
      (json['last_week_transactions'] as List<dynamic>? ?? [])
          .map((e) => LastWeekTransactionsModel.fromJson(e))
          .toList(),

      todayTransactions:
      (json['today_transactions'] as List<dynamic>? ?? [])
          .map((e) => TodayTransactionsModel.fromJson(e))
          .toList(),
    );
  }
}

class AllTransactionModel extends AllTransaction {
  AllTransactionModel({
    required super.id,
    required super.amount,
    required super.createdAt,
  });

  factory AllTransactionModel.fromJson(Map<String, dynamic> json) {
    return AllTransactionModel(
      id: json['id'] ?? 0,
      amount: json['amount'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class LastMonthTransactionsModel extends LastMonthTransactions {
  LastMonthTransactionsModel({
    required super.id,
    required super.amount,
    required super.createdAt,
  });

  factory LastMonthTransactionsModel.fromJson(Map<String, dynamic> json) {
    return LastMonthTransactionsModel(
      id: json['id'] ?? 0,
      amount: json['amount'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class LastWeekTransactionsModel extends LastWeekTransactions {
  LastWeekTransactionsModel({
    required super.id,
    required super.amount,
    required super.createdAt,
  });

  factory LastWeekTransactionsModel.fromJson(Map<String, dynamic> json) {
    return LastWeekTransactionsModel(
      id: json['id'] ?? 0,
      amount: json['amount'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}

class TodayTransactionsModel extends TodayTransactions {
  TodayTransactionsModel({
    required super.id,
    required super.amount,
    required super.createdAt,
  });

  factory TodayTransactionsModel.fromJson(Map<String, dynamic> json) {
    return TodayTransactionsModel(
      id: json['id'] ?? 0,
      amount: json['amount'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }
}
