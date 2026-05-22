class TransactionEntity {
  final List<AllTransaction> allTransactions;
  final List<LastMonthTransactions> lastMonthTransactions;
  final List<LastWeekTransactions> lastWeekTransactions;
  final List<TodayTransactions> todayTransactions;

  TransactionEntity({
    required this.allTransactions,
    required this.lastMonthTransactions,
    required this.lastWeekTransactions,
    required this.todayTransactions,
  });
}

class AllTransaction {
  final int id;
  final int amount;
  final String createdAt;

  AllTransaction({
    required this.id,
    required this.amount,
    required this.createdAt,
  });
}

class LastMonthTransactions {
  final int id;
  final int amount;
  final String createdAt;

  LastMonthTransactions({
    required this.id,
    required this.amount,
    required this.createdAt,
  });
}

class LastWeekTransactions {
  final int id;
  final int amount;
  final String createdAt;

  LastWeekTransactions({
    required this.id,
    required this.amount,
    required this.createdAt,
  });
}

class TodayTransactions {
  final int id;
  final int amount;
  final String createdAt;

  TodayTransactions({
    required this.id,
    required this.amount,
    required this.createdAt,
  });
}
