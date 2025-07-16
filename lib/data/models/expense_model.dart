class ExpenseModel {
  final String id;
  final String familyId;
  final String budgetId;
  final String memberUserId;
  final String description;
  final double amount;
  final int expenseDate;
  final int createdAt;
  final int updatedAt;

  ExpenseModel({
    required this.id,
    required this.familyId,
    required this.budgetId,
    required this.memberUserId,
    required this.description,
    required this.amount,
    required this.expenseDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      familyId: map['family_id'],
      budgetId: map['budget_id'],
      memberUserId: map['member_user_id'],
      description: map['description'],
      amount: (map['amount'] as num).toDouble(),
      expenseDate: map['expense_date'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'family_id': familyId,
      'budget_id': budgetId,
      'member_user_id': memberUserId,
      'description': description,
      'amount': amount,
      'expense_date': expenseDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
