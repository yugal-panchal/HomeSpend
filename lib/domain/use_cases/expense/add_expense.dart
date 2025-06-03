import 'package:expense_manager/domain/entities/expense.dart';
import 'package:expense_manager/domain/repositories/expense_repository.dart';

class AddExpenseUseCase {
  final ExpenseRepository expenseRepository;

  AddExpenseUseCase(this.expenseRepository);

  Future<bool> call(Expense expense) async {
    return await expenseRepository.addExpense(expense);
  }
}