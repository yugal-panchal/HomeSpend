class BudgetModel {
  final String id;
  final String familyId;
  final String headUserId;
  final String name;
  final double totalAmount;
  final int month;
  final int year;
  final bool isActive;
  final int createdAt;
  final int updatedAt;

  BudgetModel({
    required this.id,
    required this.familyId,
    required this.headUserId,
    required this.name,
    required this.totalAmount,
    required this.month,
    required this.year,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BudgetModel.fromMap(Map<String, dynamic> map) {
    return BudgetModel(
      id: map['id'],
      familyId: map['family_id'],
      headUserId: map['head_user_id'],
      name: map['name'],
      totalAmount: (map['total_amount'] as num).toDouble(),
      month: map['month'],
      year: map['year'],
      isActive: map['is_active'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'family_id': familyId,
      'head_user_id': headUserId,
      'name': name,
      'total_amount': totalAmount,
      'month': month,
      'year': year,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
