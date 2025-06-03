import 'package:expense_manager/domain/entities/expense.dart';

abstract class ExpenseRepository {
  Future<bool> addExpense(Expense expense);
}