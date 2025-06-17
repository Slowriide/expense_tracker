import 'package:control_gastos/common/utils/expense_category_from_string.dart';

enum ExpenseCategory {
  food,
  transport,
  entertainment,
  shopping,
  utilities,
  healt,
  gym,
  education,
  work,
  other,
}

class Expense {
  final int? id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final bool isIncome;

  Expense({
    this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.isIncome,
  });

  Expense copyWith({
    int? id,
    String? title,
    double? amount,
    DateTime? date,
    ExpenseCategory? category,
    bool? isIncome,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      isIncome: isIncome ?? this.isIncome,
    );
  }

  @override
  String toString() {
    return 'Expense(id: $id, title: $title, amount: $amount, date: $date, category: $category)';
  }

  Map<String, dynamic> toMap() {
    final map = {
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category.name,
      'isIncome': isIncome ? 1 : 0, // Store boolean as integer
    };
    if (id != null) map['id'] = id!;
    return map;
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: DateTime.parse(map['date'] as String),
      category: expenseCategoryFromString(map['category'] as String?),
      isIncome: (map['isIncome'] as int) == 1, // Convert integer to boolean
    );
  }
}
