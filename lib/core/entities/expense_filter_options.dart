class ExpenseFilterOptions {
  final bool onlyShowPendingExpenses;

  ExpenseFilterOptions({
    required this.onlyShowPendingExpenses,
  });

  ExpenseFilterOptions copyWith({
    bool? onlyShowPendingExpenses,
  }) {
    return ExpenseFilterOptions(
      onlyShowPendingExpenses:
          onlyShowPendingExpenses ?? this.onlyShowPendingExpenses,
    );
  }
}
