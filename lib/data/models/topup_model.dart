class TopupModel {
  final String id;
  final String familyId;
  final String budgetId;
  final String headUserId;
  final double amount;
  final int topupDate;
  final int createdAt;
  final int updatedAt;

  TopupModel({
    required this.id,
    required this.familyId,
    required this.budgetId,
    required this.headUserId,
    required this.amount,
    required this.topupDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TopupModel.fromMap(Map<String, dynamic> map) {
    return TopupModel(
      id: map['id'],
      familyId: map['family_id'],
      budgetId: map['budget_id'],
      headUserId: map['head_user_id'],
      amount: (map['amount'] as num).toDouble(),
      topupDate: map['topup_date'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'family_id': familyId,
      'budget_id': budgetId,
      'head_user_id': headUserId,
      'amount': amount,
      'topup_date': topupDate,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
