import 'package:home_spend/domain/entities/expense.dart';

abstract class ExpenseRepository {
  Future<bool> addExpense(Expense expense);
}