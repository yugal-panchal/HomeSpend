import 'package:home_spend/domain/entities/expense.dart';
import 'package:home_spend/domain/repositories/expense_repository.dart';

class AddExpenseUseCase {
  final ExpenseRepository expenseRepository;

  AddExpenseUseCase(this.expenseRepository);

  Future<bool> call(Expense expense) async {
    return await expenseRepository.addExpense(expense);
  }
}